//
//  SplashViewController.m
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "SplashViewController.h"
#import "HomeViewController.h"
#import "AppDelegate.h"


@interface SplashViewController ()

@end

@implementation SplashViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(IBAction)nextButtonHit
{
    AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [del.homeViewController splashViewComplete];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    [del.homeViewController splashViewComplete];
    
    [NSTimer scheduledTimerWithTimeInterval:4 target:del.homeViewController selector:@selector(splashViewComplete) userInfo:nil repeats:NO];
    
}


@end
