//
//  HomeViewController.m
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "HomeViewController.h"
#import "VulerabilityViewController.h"

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

-(void)loginViewComplete
{
    NSLog(@"loginViewComplete");
    
    self.takePhotoViewController = [[TakePhotoViewController alloc] initWithNibName:@"TakePhotoViewController" bundle:nil];
    [self.view addSubview:self.takePhotoViewController.view];
    
    [self.loginViewController.view removeFromSuperview];
}

-(void)takePhotoViewComplete
{
    self.mediaPlayerViewController = [[MediaPlayerViewController alloc] initWithNibName:@"MediaPlayerViewController" bundle:nil];
    [self.view addSubview:self.mediaPlayerViewController.view];
    
    [self.takePhotoViewController.view removeFromSuperview];
    
    
}

@end
