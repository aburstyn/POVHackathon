//
//  HomeViewController.m
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

static HomeViewController *theSharedHomeViewController;


@synthesize splashViewController, loginViewController;
@synthesize takePhotoViewController;

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
    
    self.splashViewController = [[SplashViewController alloc] initWithNibName:@"SplashViewController" bundle:nil];
    [self.view addSubview:self.splashViewController.view];
	// Do any additional setup after loading the view.
}


-(void)splashViewComplete
{
    NSLog(@"splashViewComplete");
   
    [self.splashViewController.view removeFromSuperview];
    
    
    self.loginViewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    [self.view addSubview:self.loginViewController.view];

}

-(void)loginViewComplete
{
    NSLog(@"loginViewComplete");
    
    self.takePhotoViewController = [[TakePhotoViewController alloc] initWithNibName:@"TakePhotoViewController" bundle:nil];
    [self.view addSubview:self.takePhotoViewController.view];
}

@end
