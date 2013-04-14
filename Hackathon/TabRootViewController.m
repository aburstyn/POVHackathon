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

@synthesize alignImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.inventoryViewController = [[InventoryViewController alloc] initWithNibName:@"InventoryViewController" bundle:nil];        
        self.trophyViewController = [[TrophyViewController alloc] initWithNibName:@"TrophyViewController" bundle:nil];
        
        NSLog(@"self.inventoryViewController: %@", self.inventoryViewController);
        NSLog(@"trophyViewController: %@", self.trophyViewController);
        

        self.youViewController = [[YouViewController alloc] initWithNibName:@"YouViewController" bundle:nil];
        self.mapViewController = [[TheMapViewController alloc] initWithNibName:@"TheMapViewController" bundle:nil];
        self.mapViewController.theTabRootViewController = self;
//        self.viewControllers = @[youViewController, mapViewController];
            
        self.viewControllers = @[self.youViewController, self.mapViewController, self.inventoryViewController, self.trophyViewController];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


-(void)journeyCompleted
{
    self.view.backgroundColor = [UIColor blackColor];
    
    self.alignImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10,0,550, 270)];
    self.alignImageView.image = [UIImage imageNamed:@"found_character.png"];
    self.alignImageView.alpha = 0;
    [self.view addSubview:self.alignImageView];
    
        
    self.doneButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
    self.doneButton.frame = CGRectMake(100,100,100,50);
    [self.doneButton addTarget:self action:@selector(presentMediaPlayer) forControlEvents:UIControlEventTouchUpInside];
    [self.doneButton setTitle:@"done" forState:UIControlStateNormal];
    [self.view addSubview:self.doneButton];
    self.doneButton.alpha = 0;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.45];
    self.alignImageView.alpha = 1;
    self.doneButton.alpha = 1;
    [self.mapViewController.view removeFromSuperview];
    [UIView commitAnimations];

    
}

-(void)presentMediaPlayer
{
    [self.alignImageView removeFromSuperview];
    [self.doneButton removeFromSuperview];
    MediaPlayerViewController *mediaPlayerViewController = [[MediaPlayerViewController alloc] initWithNibName:@"MediaPlayerViewController" bundle:nil];
    [self.view addSubview:mediaPlayerViewController.view];

}

@end
