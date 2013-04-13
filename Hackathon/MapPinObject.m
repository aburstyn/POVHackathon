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
@synthesize title;
@synthesize subTitle;

- (id)initWithCoordinates:(CLLocationCoordinate2D)location placeName:(NSString *)placeName description:(NSString *)description
{
    self = [super init];
    self.coordinate = location;
    self.title = placeName;
    self.subTitle = description;
    self.cllocation = [[CLLocation alloc] initWithLatitude:location.latitude longitude:location.longitude];
    
    return self;
}

- (NSString *) title {
    return @"Thats the title";
}

- (NSString *) subtitle {
    return @"Thats the sub";
}



@end
