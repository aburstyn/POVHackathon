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


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    
    self.homeViewController = [[HomeViewController alloc] initWithNibName:nil bundle:nil];
    
    
//    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
  //  self.tabBarController.viewControllers = @[homeViewController];
    self.window.rootViewController = self.homeViewController;
    [self.window makeKeyAndVisible];

    /*
    MapViewController *viewController1 = [[MapViewController alloc] initWithNibName:nil bundle:nil];
    viewController1.view.backgroundColor = [UIColor whiteColor];
    
    PositionTracker *positionTracker = [[PositionTracker alloc] init];
    positionTracker.delegate = viewController1;
    [positionTracker beginTrackingLocation];
    */
    
    [self transitionToRootTabBar];
    return YES;
}

-(void)transitionToRootTabBar
{
    self.tabRootViewController = [[TabRootViewController alloc] initWithNibName:nil bundle:nil];
    self.window.rootViewController = self.tabRootViewController;    
}


- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}



/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
