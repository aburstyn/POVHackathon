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
@interface TheMapViewController ()

@end

@implementation TheMapViewController

@synthesize mapView, pinObjectsArray;

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
    mapPinObject = [[MapPinObject alloc] initWithCoordinates:coord placeName:@"End" description:@"End Description"];
    [self.mapView addAnnotation:mapPinObject];

    
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
//    NSLog(@"%@ %s newLocation: %@", self, __func__, newLocation);
    
    [self.mapView setCenterCoordinate:newLocation.coordinate];
    if ([self.pinObjectsArray count] > 0)
    {
        MapPinObject *mapPinObject = [self.pinObjectsArray objectAtIndex:0];
//        CLLocationDegrees latDelta =  fabs(newLocation.coordinate.latitude - mapPinObject.coordinate.latitude);
//        CLLocationDegrees lonDelta =  fabs(newLocation.coordinate.longitude - mapPinObject.coordinate.longitude);
//        CLLocationCoordinate2D pointA = CLLocationCoordinate2DMake(mapPinObject.coordinate.latitude, mapPinObject.coordinate.longitude);
//        CLLocationCoordinate2D pointB = CLLocationCoordinate2DMake(newLocation.coordinate.latitude, newLocation.coordinate.longitude);
        
        CLLocation *thePinLocation = [[CLLocation alloc] initWithLatitude:mapPinObject.coordinate.latitude longitude:mapPinObject.coordinate.longitude];
        CLLocationDistance meters = [newLocation distanceFromLocation:thePinLocation];
        
//        NSLog(@"dist: %f", meters);
//        NSLog(@" ");
        
        QuestObject *questObject = [QuestObject getSharedQuestObject];
        if (questObject == nil)
        {
            NSLog(@"create!");
            NSArray *questObject = [NSArray arrayWithObjects:@"Towel", @"Blanket", @"T-shirt", @"food", nil];
            [QuestObject createQuestObjectWithStartLocation:newLocation endLocation:mapPinObject.cllocation withQuestObjects:questObject];
        }
        
        NSLog(@"questObject.questObjects: %@", questObject.questObjects);
        
    }
    
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(newLocation.coordinate.latitude, newLocation.coordinate.longitude), 1000,1000)];
    
    
//
    
//    MKCoordinateRegion
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
