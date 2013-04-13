//
//  PositionTracker.h
//  Hackathon
//
//  Created by Josh Klobe on 4/10/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface PositionTracker : NSObject <CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}

-(void)beginTrackingLocation;

@property (nonatomic, retain) CLLocationManager *locationManager;
@end
