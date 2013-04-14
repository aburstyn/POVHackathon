//
//  AppDelegate.m
//  Hackathon
//
//  Created by Josh Klobe on 4/10/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "AppDelegate.h"
#import "PositionTracker.h"
#import "HomeViewController.h"
#import "TabRootViewController.h"

@implementation AppDelegate

@synthesize homeViewController;
@synthesize tabRootViewController;


@synthesize positionTracker;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.homeViewController = [[HomeViewController alloc] initWithNibName:nil bundle:nil];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.rootViewController = self.homeViewController;
    [self.window makeKeyAndVisible];

    
    self.positionTracker = [[PositionTracker alloc] init];
    [self.positionTracker beginTrackingLocation];
        
//    [self transitionToRootTabBar];
    return YES;
}

-(void)transitionToRootTabBar
{
    self.tabRootViewController = [[TabRootViewController alloc] initWithNibName:nil bundle:nil];
    self.window.rootViewController = self.tabRootViewController;    
    self.positionTracker.delegate = self.tabRootViewController.mapViewController;
}


- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}



@end
