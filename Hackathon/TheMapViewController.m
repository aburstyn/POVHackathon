//
//  TheMapViewController.m
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "TheMapViewController.h"
#import "MapPinObject.h"
#import "QuestObject.h"
#import "TabRootViewController.h"
#import "FoundItemViewController.h"
@interface TheMapViewController ()

@end

@implementation TheMapViewController

@synthesize mapView, pinObjectsArray, tripDistance, theTabRootViewController, distanceLabel, startButton, infoBackgroundView;

@synthesize hasStartedTrip;
@synthesize hasTripEnded;
@synthesize hasPresentedFirstConnect;
@synthesize goToOverlayImageView;

@synthesize progressBackgroundImageView;
@synthesize progressSlider;

@synthesize holdDistance;

@synthesize startInterstatialImageView;

@synthesize allowAction;

@synthesize infoLabel;
@synthesize infoIter;

@synthesize infoArray;
static float desiredRange = 18;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.pinObjectsArray = [[NSMutableArray alloc] initWithCapacity:0];
        
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"map_icon.png"] tag:0];
        
        
        self.infoArray = [[NSMutableArray alloc] initWithCapacity:0];        
        [self.infoArray addObject:@"Total number of homeless people in municipal shelters: 50,135"];
        [self.infoArray addObject:@"Number of homeless families: 11,984"];
        [self.infoArray addObject:@"Number of homeless children: 21,034"];
        [self.infoArray addObject:@"Number of homeless adults in families: 18,261"];
        [self.infoArray addObject:@"Number of homeless single adults: 10,840"];
        [self.infoArray addObject:@"Number of homeless single men:  8,082"];
        [self.infoArray addObject:@"Number of homeless single women: 2,758"];
        
    }
    return self;
}


-(void)simulateButtonHit
{
    NSLog(@"simulateButtonHit!");
//    self.holdDistance = sentinalValue;
    
    self.allowAction = YES;
}


-(void)viewDidLoad
{
    [super viewDidLoad];
 
    self.holdDistance = desiredRange;
    
    self.mapView.showsUserLocation = YES;
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(40.70443484470314, -73.99009639404154);
    MapPinObject *mapPinObject = [[MapPinObject alloc] initWithCoordinates:coord placeName:@"Start" description:@"Start Description"];
    [self.mapView addAnnotation:mapPinObject];
    
    [self.pinObjectsArray addObject:mapPinObject];
    coord = CLLocationCoordinate2DMake(40.702183926515936, -73.98713473237491);
    mapPinObject = [[MapPinObject alloc] initWithCoordinates:coord placeName:@"Travel here" description:@"Search Location for the homeless"];
    [self.mapView addAnnotation:mapPinObject];
    [self.pinObjectsArray addObject:mapPinObject];
    
    
    self.progressBackgroundImageView.frame = CGRectMake(self.progressBackgroundImageView.frame.origin.x, self.progressBackgroundImageView.frame.origin.y + 60, self.progressBackgroundImageView.frame.size.width, self.progressBackgroundImageView.frame.size.height);
    self.progressSlider.frame = CGRectMake(self.progressSlider.frame.origin.x, self.progressSlider.frame.origin.y + 60, self.progressSlider.frame.size.width, self.progressSlider.frame.size.height);
    
    self.progressSlider.enabled = NO;
    [self.progressSlider setValue:0];
    
    [self.progressSlider setThumbImage:[[[UIImage alloc] init] autorelease] forState:UIControlStateNormal];
    [self.progressSlider setMinimumTrackTintColor:[UIColor redColor]];
    [self.progressSlider setMaximumTrackTintColor:[UIColor clearColor]];
    NSLog(@"slider.subviews: %@", [self.progressSlider subviews]);
    
    self.mapView.delegate = self;
    
    
    NSTimer *theTimer = [NSTimer scheduledTimerWithTimeInterval:6 target:self selector:@selector(infoTimerFired) userInfo:nil repeats:YES];
    [theTimer fire];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
//    NSLog(@"didUpdateToLocation: %d", self.allowAction);
    if (!self.hasTripEnded)
    {
        [self.mapView setCenterCoordinate:newLocation.coordinate];
        if ([self.pinObjectsArray count] > 0)
        {
            if (!self.hasStartedTrip)
            {
                
                UIImage *goToParkImage = [UIImage imageNamed:@"gotopark.png"];
                if (self.goToOverlayImageView.image != goToParkImage)
                    self.goToOverlayImageView.image = goToParkImage;
                    
                MapPinObject *mapPinObject = [self.pinObjectsArray objectAtIndex:0];
                
                QuestObject *questObject = [QuestObject getSharedQuestObject];
                if (questObject == nil)
                    [QuestObject createQuestObjectWithStartLocation:newLocation endLocation:mapPinObject.cllocation];
                questObject = [QuestObject getSharedQuestObject];
                
                MapPinObject *startLocationPinObject = [self.pinObjectsArray objectAtIndex:0];
                
                
                CLLocation *startLocation = [[CLLocation alloc] initWithLatitude:startLocationPinObject.coordinate.latitude longitude:startLocationPinObject.coordinate.longitude];
                CLLocation *thePinLocation = [[CLLocation alloc] initWithLatitude:mapPinObject.coordinate.latitude longitude:mapPinObject.coordinate.longitude];
                CLLocationDistance distanceInmeters = [newLocation distanceFromLocation:thePinLocation];
                
                distanceInmeters = [startLocation distanceFromLocation:newLocation];
                if (self.tripDistance == nil)
                    self.tripDistance = [NSNumber numberWithFloat:distanceInmeters];
                
                self.distanceLabel.text = [NSString stringWithFormat:@"%f", distanceInmeters];
                
                if (distanceInmeters < holdDistance || self.allowAction)
                {
                    self.hasStartedTrip = YES;
                    

                    [self journeyBegan];
                    
                    /*self.startButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
                    self.startButton.frame = CGRectMake(0,0,520, 300);
                    [self.startButton addTarget:self action:@selector(journeyBegan) forControlEvents:UIControlEventTouchUpInside];
                    [self.view addSubview:self.startButton];
                    */
                    self.tripDistance = nil;
                    
                }
                
                self.iterationDistance = [NSNumber numberWithFloat:distanceInmeters / [questObject.questObjects count]];
                
                float pct = ([self.tripDistance floatValue] - distanceInmeters) / [self.tripDistance floatValue];
                [self.progressSlider setValue:pct];
                
            }
            else
            {
                                
                QuestObject *questObject = [QuestObject getSharedQuestObject];
                questObject = [QuestObject getSharedQuestObject];
                questObject = [QuestObject getSharedQuestObject];
                MapPinObject *endLocationPinObject = [self.pinObjectsArray objectAtIndex:1];
                CLLocation *endLocation = [[CLLocation alloc] initWithLatitude:endLocationPinObject.coordinate.latitude longitude:endLocationPinObject.coordinate.longitude];
                
                CLLocationDistance distanceInmeters = [newLocation distanceFromLocation:endLocation];
                
                if (self.tripDistance == nil)
                    self.tripDistance = [NSNumber numberWithFloat:distanceInmeters];
               
                NSString *theQuestObjectString = [questObject.questObjects objectAtIndex:0];
                NSLog(@"theQuestObjectString");
                if (![questObject.receivedQuestObjects containsObject:theQuestObjectString])
                {
                    [questObject.receivedQuestObjects addObject:theQuestObjectString];
                    NSLog(@"questObject.receivedQuestObjects: %@", questObject.receivedQuestObjects);
                    FoundItemViewController *foundItemViewController = [[FoundItemViewController alloc] initWithNibName:@"FoundItemViewController" bundle:nil];
                    foundItemViewController.delegate = self;
                    foundItemViewController.view.backgroundColor = [UIColor clearColor];
                    [foundItemViewController initializeWithObjectString:theQuestObjectString];
                    foundItemViewController.view.alpha = 0;
                    [self.view addSubview:foundItemViewController.view];
                    
                    [UIView beginAnimations:nil context:nil];
                    [UIView setAnimationDuration:1];
                    foundItemViewController.view.alpha = 1;
                    [UIView commitAnimations];
                    
                }
                
                /*
                
                int indexPosition = [[NSNumber numberWithFloat:roundf(distanceInmeters / [self.iterationDistance floatValue]) / [questObject.questObjects count]] intValue];
                
                self.distanceLabel.text = [NSString stringWithFormat:@"%f", distanceInmeters];
                if (distanceInmeters < 400)
                {
                if (indexPosition % 4 == 0)
                {
                    NSString *theQuestObjectString = [questObject.questObjects objectAtIndex:0];
                    if (![questObject.receivedQuestObjects containsObject:theQuestObjectString])
                    {
                        [questObject.receivedQuestObjects addObject:theQuestObjectString];
                        
                        FoundItemViewController *foundItemViewController = [[FoundItemViewController alloc] initWithNibName:@"FoundItemViewController" bundle:nil];
                        foundItemViewController.delegate = self;                        
                        foundItemViewController.view.backgroundColor = [UIColor clearColor];
                        [foundItemViewController initializeWithObjectString:theQuestObjectString];
                        foundItemViewController.view.alpha = 0;
                        [self.view addSubview:foundItemViewController.view];
                        
                        [UIView beginAnimations:nil context:nil];
                        [UIView setAnimationDuration:1];
                        foundItemViewController.view.alpha = 1;
                        [UIView commitAnimations];
                        
                    }
                }
                 
                }
                 */
                if (distanceInmeters < holdDistance + 25 || self.allowAction)
                {
                    
                    [self.theTabRootViewController journeyCompleted];                    
                    self.hasTripEnded = YES;
                }
                
                float pct = ([self.tripDistance floatValue] - distanceInmeters) / [self.tripDistance floatValue];
                [self.progressSlider setValue:pct];

                
                
            }
        }
        
        [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(newLocation.coordinate.latitude, newLocation.coordinate.longitude), 1000,1000)];                
    }

    
    self.allowAction = NO;
}

-(void)journeyBegan
{
    [self.startInterstatialImageView removeFromSuperview];
    [self.startButton removeFromSuperview];
    
    UIImage *goToBridgeImage = [UIImage imageNamed:@"gotobridge.png"];
    if (self.goToOverlayImageView.image != goToBridgeImage)
        self.goToOverlayImageView.image = goToBridgeImage;
}

-(void)foundAcceptButtonHit:(FoundItemViewController *)vc
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    vc.view.alpha = 0;
    [UIView commitAnimations];
    self.hasPresentedFirstConnect = YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self.theTabRootViewController journeyCompleted];
}


- (MKAnnotationView *)mapView:(MKMapView *)mapview viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    static NSString* AnnotationIdentifier = @"AnnotationIdentifier";
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationIdentifier];
    annotationView.image = [UIImage imageNamed:[NSString stringWithFormat:@"locationscren.png"]];
    if(annotationView)
        return annotationView;
    else
    {
        MKAnnotationView *annotationView = [[[MKAnnotationView alloc] initWithAnnotation:annotation
                                                                         reuseIdentifier:AnnotationIdentifier] autorelease];
        annotationView.canShowCallout = YES;
        annotationView.image = [UIImage imageNamed:[NSString stringWithFormat:@"someImage.png"]];
        
    }
    
    return nil;
    
}

-(void)createAndShowInfoLabel
{
    float infoInset = 15;
    
    self.infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.infoBackgroundView.frame.origin.x + infoInset, self.infoBackgroundView.frame.origin.y - self.infoBackgroundView.frame.size.height, self.infoBackgroundView.frame.size.width - infoInset, self.infoBackgroundView.frame.size.height)];
    self.infoLabel.numberOfLines = 0;
    self.infoLabel.backgroundColor = [UIColor clearColor];
    self.infoLabel.textColor = [UIColor whiteColor];
    self.infoLabel.text = [self.infoArray objectAtIndex:infoIter];
    self.infoLabel.textAlignment = NSTextAlignmentLeft;
    self.infoLabel.font = [UIFont fontWithName:@"SignPainter" size:self.infoLabel.frame.size.height - 20];
    [self.view addSubview:self.infoLabel];
    
    
    [UIView beginAnimations:@"AnimateIn" context:nil];
    [UIView setAnimationDuration:.5];
    self.infoLabel.frame = CGRectMake(self.infoLabel.frame.origin.x, self.infoBackgroundView.frame.origin.y, self.infoLabel.frame.size.width, self.infoLabel.frame.size.height);
    [UIView commitAnimations];
    
    self.infoIter++;
    if (self.infoIter == [self.infoArray count])
        self.infoIter = 0;
   
}
-(void)infoTimerFired
{
    if (self.infoLabel == nil)
    {
        [self createAndShowInfoLabel];
    }
    else
    {
        [UIView beginAnimations:@"AnimateOut" context:nil];
        [UIView setAnimationDuration:.5];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(infoLabelDidHide)];
        self.infoLabel.alpha = 0;
        [UIView commitAnimations];
    }

}
-(void)infoLabelDidHide
{
    [self.infoLabel removeFromSuperview];
    [self.infoLabel release];
    self.infoLabel = nil;
    
    [self createAndShowInfoLabel];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
