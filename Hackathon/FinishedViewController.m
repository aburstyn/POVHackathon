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

@synthesize theImageView;

@synthesize  imageViewOne;
@synthesize  imageViewTwo;
@synthesize  imageViewThree;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = CGRectMake(0,0,self.view.frame.size.width, 320);
}

-(IBAction)donateButtonHit
{
    [self.imageViewOne removeFromSuperview];
    [self.imageViewTwo removeFromSuperview];
    [self.imageViewThree removeFromSuperview];
    
    self.theImageView.image = [UIImage imageNamed:@"finished_location.png"];
    NSLog(@"donateButtonHit");
}

-(IBAction)volunteerButtonHit
{
    NSLog(@"volunteerButtonHit");    
}


@end
