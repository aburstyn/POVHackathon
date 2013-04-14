//
//  VulerabilityViewController.m
//  Hackathon
//
//  Created by Josh Klobe on 4/14/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "VulerabilityViewController.h"

@interface VulerabilityViewController ()

@end

@implementation VulerabilityViewController

@synthesize howLabel, indexTouchView;

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
    self.howLabel.numberOfLines = 0;
    self.howLabel.text = @"HOW VULNERABLE IS VIPER?";
    self.howLabel.font = [UIFont fontWithName:@"SignPainter" size:25];
    

    self.indexTouchView.delegate = self;
    self.indexTouchView.backgroundColor = [UIColor clearColor];
    UIImage *sliderTabImage = [UIImage imageNamed:@"slider_tab.png"];
    
    self.indexBarView = [[UIImageView alloc] initWithFrame:CGRectMake(self.indexTouchView.frame.origin.x, self.indexTouchView.frame.origin.y - 9, 10, self.indexTouchView.frame.size.height + 12)];
    self.indexBarView.image = sliderTabImage;
    [self.view addSubview:self.indexBarView];
    
}

-(void)touchMovedWithXPos:(float)xPos
{
    CGRect newFrame = CGRectMake(self.indexTouchView.frame.origin.x + xPos, self.indexBarView.frame.origin.y, self.indexBarView.frame.size.width, self.indexBarView.frame.size.height);
    
    if (newFrame.origin.x > self.indexTouchView.frame.origin.x && newFrame.origin.x < self.indexTouchView.frame.origin.x + self.indexTouchView.frame.size.width - self.indexBarView.frame.size.width)
        self.indexBarView.frame = newFrame;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
