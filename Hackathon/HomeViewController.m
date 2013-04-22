//
//  HomeViewController.m
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "HomeViewController.h"
#import "VulerabilityViewController.h"
#import "AppDelegate.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

static HomeViewController *theSharedHomeViewController;


@synthesize splashViewController, loginViewController;
@synthesize takePhotoViewController, mediaPlayerViewController;

@synthesize setupViewController;


+(HomeViewController *)sharedHomeViewController
{
    if (theSharedHomeViewController == nil)
        theSharedHomeViewController = [[HomeViewController alloc] initWithNibName:nil bundle:nil];
    
    return theSharedHomeViewController;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    self.view.frame = CGRectMake(0,0,520,320);
        
    self.setupViewController = [[SetupViewController alloc] initWithNibName:@"SetupViewController" bundle:nil];
    self.setupViewController.delegate = self;
    [self.view addSubview:self.setupViewController.view];
    
    self.splashViewController = [[SplashViewController alloc] initWithNibName:@"SplashViewController" bundle:nil];
    [self.view addSubview:self.splashViewController.view];
}


-(void)splashViewComplete
{
    NSLog(@"splashViewComplete");
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.55];
    self.splashViewController.view.alpha = 0;
    [UIView commitAnimations];
    
}

-(void)setupViewComplete
{
    NSLog(@"setupViewComplete");
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.positionTracker.delegate = self;
    [delegate.positionTracker beginTrackingLocation];
    
    
    self.holdingView = [[UIView alloc] initWithFrame:self.setupViewController.view.frame];
    self.holdingView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.holdingView];
    self.holdingView.alpha = 0;
    
    self.holdingActivityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.holdingActivityIndicator.frame = CGRectMake(self.holdingView.frame.size.width / 2 - self.holdingActivityIndicator.frame.size.width / 2, self.holdingView.frame.size.height / 2 - self.holdingActivityIndicator.frame.size.height / 2, self.holdingActivityIndicator.frame.size.width, self.holdingActivityIndicator.frame.size.height);
    [self.holdingView addSubview:self.holdingActivityIndicator];
    self.holdingActivityIndicator.alpha = 0;

    NSLog(@"self.holdingActivityIndicator: %@", self.holdingActivityIndicator);
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.55];
    self.holdingView.alpha = 1;
    self.holdingActivityIndicator.alpha = 1;
    [UIView commitAnimations];
    
    [self.holdingActivityIndicator startAnimating];
    
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@ manager: %@ didUpdateToLocation: %@", self, manager, newLocation);
    
    UIImageView *startInterstatialImageView = [[UIImageView alloc] initWithFrame:setupViewController.view.frame];
    startInterstatialImageView.image = [UIImage imageNamed:@"locationscreen.png"];
    [self.view addSubview:startInterstatialImageView];
    startInterstatialImageView.alpha = 0;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.55];
    startInterstatialImageView.alpha = 1;
    [UIView commitAnimations];
    
    UIButton *theButton = [UIButton buttonWithType:UIButtonTypeCustom];
    theButton.frame = startInterstatialImageView.frame;
    [theButton addTarget:self action:@selector(theButtonHit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:theButton];
    
    
    
    
}

-(void)theButtonHit
{
    AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [del transitionToRootTabBar];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}


@end
