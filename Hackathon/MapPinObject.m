//
//  MapPinObject.m
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "MapPinObject.h"

@implementation MapPinObject

@synthesize coordinate;
@synthesize cllocation;
@synthesize titleString;
@synthesize subTitleString;

- (id)initWithCoordinates:(CLLocationCoordinate2D)location placeName:(NSString *)placeName description:(NSString *)description
{
    self = [super init];
    self.coordinate = location;
    self.titleString = placeName;
    self.subTitleString = description;
    self.cllocation = [[CLLocation alloc] initWithLatitude:location.latitude longitude:location.longitude];
    
    return self;
}

- (NSString *) title {
    return self.titleString;
}

- (NSString *) subtitle {
    return self.subTitleString;
}



@end
