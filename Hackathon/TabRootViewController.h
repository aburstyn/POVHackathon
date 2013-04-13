//
//  TabRootViewController.h
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YouViewController.h"
#import "TheMapViewController.h"

@interface TabRootViewController : UITabBarController
{
    YouViewController *youViewController;
    TheMapViewController *mapViewController;
}

@property (nonatomic, retain) YouViewController *youViewController;
@property (nonatomic, retain) TheMapViewController *mapViewController;
@end
