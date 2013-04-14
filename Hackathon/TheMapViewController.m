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
@interface TheMapViewController ()

@end

@implementation TheMapViewController

@synthesize mapView, pinObjectsArray, tripDistance, theTabRootViewController, distanceLabel;

static float holdDistance = 18;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.pinObjectsArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mapView.showsUserLocation = YES;
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(40.70443484470314, -73.99009639404154);
    MapPinObject *mapPinObject = [[MapPinObject alloc] initWithCoordinates:coord placeName:@"Start" description:@"Start Description"];
    [self.mapView addAnnotation:mapPinObject];
    
    [self.pinObjectsArray addObject:mapPinObject];
    coord = CLLocationCoordinate2DMake(40.702183926515936, -73.98713473237491);
    mapPinObject = [[MapPinObject alloc] initWithCoordinates:coord placeName:@"Travel here" description:@"Search Location for the homeless"];
    [self.mapView addAnnotation:mapPinObject];
    [self.pinObjectsArray addObject:mapPinObject];
    
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"newLocation: %@", newLocation);
    NSLog(@"self.hasStartedTrip: %d", self.hasStartedTrip);
    NSLog(@"self.hasTripEnded: %d", self.hasTripEnded);
    if (!self.hasTripEnded)
    {
        [self.mapView setCenterCoordinate:newLocation.coordinate];
        if ([self.pinObjectsArray count] > 0)
        {
            if (!self.hasStartedTrip)
            {
                MapPinObject *mapPinObject = [self.pinObjectsArray objectAtIndex:0];
                
                QuestObject *questObject = [QuestObject getSharedQuestObject];
                if (questObject == nil)
                {                    

                    [QuestObject createQuestObjectWithStartLocation:newLocation endLocation:mapPinObject.cllocation withQuestObjects:questObject];
                }
                
                questObject = [QuestObject getSharedQuestObject];
                

                
                MapPinObject *startLocationPinObject = [self.pinObjectsArray objectAtIndex:0];
                MapPinObject *endLocationPinObject = [self.pinObjectsArray objectAtIndex:1];
                
                CLLocation *startLocation = [[CLLocation alloc] initWithLatitude:startLocationPinObject.coordinate.latitude longitude:startLocationPinObject.coordinate.longitude];
                CLLocation *endLocation = [[CLLocation alloc] initWithLatitude:endLocationPinObject.coordinate.latitude longitude:endLocationPinObject.coordinate.longitude];
                
                CLLocation *thePinLocation = [[CLLocation alloc] initWithLatitude:mapPinObject.coordinate.latitude longitude:mapPinObject.coordinate.longitude];
                CLLocationDistance distanceInmeters = [newLocation distanceFromLocation:thePinLocation];
                
                distanceInmeters = [startLocation distanceFromLocation:newLocation];
                self.tripDistance = [NSNumber numberWithFloat:distanceInmeters];
                
                self.distanceLabel.text = [NSString stringWithFormat:@"%f", distanceInmeters];
                
                NSLog(@"distance to start: %f", distanceInmeters);
                NSLog(@" ");
                
                if (distanceInmeters < holdDistance)
                {
                    self.hasStartedTrip = YES;
                    
                    UIAlertView  *alert = [[UIAlertView alloc] initWithTitle:@"Journey Started"
                                                                     message:@"Please travel to your endpoint"
                                                                    delegate:nil
                                                           cancelButtonTitle:@"Ok"
                                                           otherButtonTitles:nil];
                    
                    [alert show];
                    [alert release];
                }
                
                self.iterationDistance = [NSNumber numberWithFloat:distanceInmeters / [questObject.questObjects count]];
//                NSLog(@"distanceInmeters / [questObject.questObjects count]: %f", distanceInmeters / [questObject.questObjects count]);
                
            }
            else
            {
                
                QuestObject *questObject = [QuestObject getSharedQuestObject];
                MapPinObject *endLocationPinObject = [self.pinObjectsArray objectAtIndex:1];
                CLLocation *endLocation = [[CLLocation alloc] initWithLatitude:endLocationPinObject.coordinate.latitude longitude:endLocationPinObject.coordinate.longitude];
                
                CLLocationDistance distanceInmeters = [newLocation distanceFromLocation:endLocation];
                
                int indexPosition = [[NSNumber numberWithFloat:roundf(distanceInmeters / [self.iterationDistance floatValue]) / [questObject.questObjects count]] intValue];
                
                NSLog(@"distanceInMeters: %f", distanceInmeters);
                NSLog(@"self.iterationDistance: %f", [self.iterationDistance floatValue]);
                NSLog(@"indexPosition: %d", indexPosition);
                self.distanceLabel.text = [NSString stringWithFormat:@"%f", distanceInmeters];
                
                

                
                if (indexPosition % 4 == 0)
                {
                NSString *theQuestObjectString = [questObject.questObjects objectAtIndex:indexPosition];
                if (![questObject.receivedQuestObjects containsObject:theQuestObjectString])
                {
                    [questObject.receivedQuestObjects addObject:theQuestObjectString];
                    
                    UIAlertView  *alert = [[UIAlertView alloc] initWithTitle:@"Object Found"
                                                                     message:[NSString stringWithFormat:@"You've Found %@", theQuestObjectString]
                                                                    delegate:nil
                                                           cancelButtonTitle:@"Store It!"
                                                           otherButtonTitles:nil];
                    
                    [alert show];
                    [alert release];
                    
                }
                
                }
                if (distanceInmeters < holdDistance)
                {
                    
                    
                    UIAlertView  *alert = [[UIAlertView alloc] initWithTitle:@"Journey Completed"
                                                                     message:@"!"
                                                                    delegate:self
                                                           cancelButtonTitle:@"Ok"
                                                           otherButtonTitles:nil];
                    
                    [alert show];
                    [alert release];
                    self.hasTripEnded = YES;
                }
                
                
            }
            
            
            
        }
        
        [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(newLocation.coordinate.latitude, newLocation.coordinate.longitude), 1000,1000)];
        
        
    }
    
    //        CLLocationDegrees latDelta =  fabs(newLocation.coordinate.latitude - mapPinObject.coordinate.latitude);
    //        CLLocationDegrees lonDelta =  fabs(newLocation.coordinate.longitude - mapPinObject.coordinate.longitude);
    //        CLLocationCoordinate2D pointA = CLLocationCoordinate2DMake(mapPinObject.coordinate.latitude, mapPinObject.coordinate.longitude);
    //        CLLocationCoordinate2D pointB = CLLocationCoordinate2DMake(newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self.theTabRootViewController presentMediaPlayer];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
