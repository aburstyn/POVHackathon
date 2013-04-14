//
//  FinishedViewController.m
//  Hackathon
//
//  Created by Josh Klobe on 4/14/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "FinishedViewController.h"

@interface FinishedViewController ()

@end

@implementation FinishedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)donateButtonHit
{
    NSLog(@"donateButtonHit");
}

-(IBAction)volunteerButtonHit
{
    NSLog(@"volunteerButtonHit");    
}


@end
