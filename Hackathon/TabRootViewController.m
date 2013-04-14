//
//  TabRootViewController.m
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "TabRootViewController.h"
#import "MediaPlayerViewController.h"
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
        self.mapViewController.theTabRootViewController = self;
        self.viewControllers = @[youViewController, mapViewController];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


-(void)presentMediaPlayer
{
    MediaPlayerViewController *mediaPlayerViewController = [[MediaPlayerViewController alloc] initWithNibName:@"MediaPlayerViewController" bundle:nil];
    [self.view addSubview:mediaPlayerViewController.view];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
