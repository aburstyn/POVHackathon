//
//  TabRootViewController.m
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "TabRootViewController.h"

@interface TabRootViewController ()

@end

@implementation TabRootViewController

@synthesize youViewController;
@synthesize mapViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.youViewController = [[YouViewController alloc] initWithNibName:@"YouViewController" bundle:nil];
        self.mapViewController = [[TheMapViewController alloc] initWithNibName:@"TheMapViewController" bundle:nil];
        
        self.viewControllers = @[youViewController, mapViewController];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
