//
//  TheMapViewController.h
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@class TabRootViewController;
@interface TheMapViewController : UIViewController
{
    MKMapView *mapView;
    NSMutableArray *pinObjectsArray;
    
    BOOL hasStartedTrip;
    BOOL hasTripEnded;
    NSNumber *tripDistance;
    NSNumber *iterationDistance;
    
    TabRootViewController *theTabRootViewController;
    
    UILabel *distanceLabel;
    
}
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) NSMutableArray *pinObjectsArray;
@property (nonatomic, assign) BOOL hasStartedTrip;
@property (nonatomic, assign) BOOL hasTripEnded;
@property (nonatomic, retain) NSNumber *tripDistance;
@property (nonatomic, retain) NSNumber *iterationDistance;

@property (nonatomic, retain) TabRootViewController *theTabRootViewController;

@property (nonatomic, retain) IBOutlet UILabel *distanceLabel;
@end
