//
//  AppDelegate.h
//  Hackathon
//
//  Created by Josh Klobe on 4/10/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "TabRootViewController.h"
#import "PositionTracker.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>
{
    HomeViewController *homeViewController;
    TabRootViewController *tabRootViewController;
    
    PositionTracker *positionTracker;
}

@property (strong, nonatomic) HomeViewController *homeViewController;
@property (strong, nonatomic) TabRootViewController *tabRootViewController;

@property (strong, nonatomic) PositionTracker *positionTracker;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;

@end
