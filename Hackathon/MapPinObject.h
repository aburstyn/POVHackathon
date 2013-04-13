//
//  MapPinObject.h
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapPinObject : NSObject <MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
    CLLocation *cllocation;
    NSString *titleString;
    NSString *subTitleString;
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) CLLocation *cllocation;
@property (nonatomic, retain) NSString *titleString;
@property (nonatomic, retain) NSString *subTitleString;

- (id)initWithCoordinates:(CLLocationCoordinate2D)location placeName:(NSString *)placeName description:(NSString *)description;

@end
