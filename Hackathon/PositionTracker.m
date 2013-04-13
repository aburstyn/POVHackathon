//
//  PositionTracker.m
//  Hackathon
//
//  Created by Josh Klobe on 4/10/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "PositionTracker.h"

@implementation PositionTracker

@synthesize locationManager;

-(void)beginTrackingLocation
{
    if (self.locationManager != nil)
    {
        [self.locationManager stopUpdatingLocation];
        [self.locationManager release];
        self.locationManager = nil;
    }
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    if ([CLLocationManager locationServicesEnabled])
        [self.locationManager startUpdatingLocation];
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%@ %s error: %@", self, __func__, error);
    //[self.locationManager stopUpdatingLocation];
    
}


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{

    NSLog(@"%@ %s newLocation: %@", self, __func__, newLocation);
}


@end
