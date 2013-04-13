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
    NSLog(@"self.view.frame: %@", NSStringFromCGRect(self.view.frame));
  //  self.view.frame = CGRectMake(0,0,self.view.frame.size.height, self.view.frame.size.width);
    
    // Do any additional setup after loading the view from its nib.
}


@end
