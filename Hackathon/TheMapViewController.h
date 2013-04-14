//
//  TheMapViewController.h
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "FoundItemViewController.h"

@class TabRootViewController;
@interface TheMapViewController : UIViewController
{
    MKMapView *mapView;
    NSMutableArray *pinObjectsArray;
    
    BOOL hasStartedTrip;
    BOOL hasTripEnded;
    BOOL hasPresentedFirstConnect;
    
    NSNumber *tripDistance;
    NSNumber *iterationDistance;
    
    TabRootViewController *theTabRootViewController;
    
    UILabel *distanceLabel;
    
    UIImageView *goToOverlayImageView;

    UIImageView *progressBackgroundImageView;
    UISlider *progressSlider;
    
    
    float holdDistance;

    UIImageView *startInterstatialImageView;
    UIButton *startButton;
    
}

-(void)foundAcceptButtonHit:(FoundItemViewController *)vc;
-(IBAction)simulateButtonHit;

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) NSMutableArray *pinObjectsArray;
@property (nonatomic, assign) BOOL hasStartedTrip;
@property (nonatomic, assign) BOOL hasTripEnded;
@property (nonatomic, assign) BOOL hasPresentedFirstConnect;
@property (nonatomic, retain) NSNumber *tripDistance;
@property (nonatomic, retain) NSNumber *iterationDistance;

@property (nonatomic, retain) TabRootViewController *theTabRootViewController;

@property (nonatomic, retain) IBOutlet UILabel *distanceLabel;

@property (nonatomic, retain) IBOutlet UIImageView *goToOverlayImageView;

@property (nonatomic, retain) IBOutlet UIImageView *progressBackgroundImageView;
@property (nonatomic, retain) IBOutlet UISlider *progressSlider;

@property (nonatomic, assign) float holdDistance;

@property (nonatomic, retain) UIImageView *startInterstatialImageView;
@property (nonatomic, retain) UIButton *startButton;
@end
