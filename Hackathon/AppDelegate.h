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


@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>
{
    HomeViewController *homeViewController;
    TabRootViewController *tabRootViewController;
}

@property (strong, nonatomic) HomeViewController *homeViewController;
@property (strong, nonatomic) TabRootViewController *tabRootViewController;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;

@end
