//
//  VulerabilityViewController.m
//  Hackathon
//
//  Created by Josh Klobe on 4/14/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "VulerabilityViewController.h"
#import "FinishedViewController.h"

@interface VulerabilityViewController ()

@end

@implementation VulerabilityViewController

@synthesize howLabel, indexTouchView, indexBarView, screenGrabImage, screenGrabImageView, theTextView;

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
    
    self.view.frame = CGRectMake(0,0,self.view.frame.size.width, 330);
    
    self.howLabel.numberOfLines = 0;
    self.howLabel.text = @"HOW VULNERABLE IS CHET?";
    self.howLabel.font = [UIFont fontWithName:@"SignPainter" size:25];
    

    self.indexTouchView.delegate = self;
    self.indexTouchView.backgroundColor = [UIColor clearColor];
    UIImage *sliderTabImage = [UIImage imageNamed:@"slider_tab.png"];
    
    self.indexBarView = [[UIImageView alloc] initWithFrame:CGRectMake(self.indexTouchView.frame.origin.x, self.indexTouchView.frame.origin.y - 9, 10, self.indexTouchView.frame.size.height + 12)];
    self.indexBarView.image = sliderTabImage;
    [self.view addSubview:self.indexBarView];
    
    
    self.indexBarView.frame = CGRectMake(self.indexBarView.frame.origin.x + 18, self.indexBarView.frame.origin.y, self.indexBarView.frame.size.width, self.indexBarView.frame.size.height);
    
    self.theTextView.delegate = self;
    self.theTextView.font = [UIFont fontWithName:@"SignPainter" size:15];
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        // Return FALSE so that the final '\n' character doesn't get added
        return NO;
    }
    // For any other character return TRUE so that the text gets added to the view
    return YES;
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self.theTextView resignFirstResponder];
    return NO;
}

-(void)touchMovedWithXPos:(float)xPos
{
    CGRect newFrame = CGRectMake(self.indexTouchView.frame.origin.x + xPos, self.indexBarView.frame.origin.y, self.indexBarView.frame.size.width, self.indexBarView.frame.size.height);
    
    if (newFrame.origin.x > self.indexTouchView.frame.origin.x && newFrame.origin.x < self.indexTouchView.frame.origin.x + self.indexTouchView.frame.size.width - self.indexBarView.frame.size.width)
        self.indexBarView.frame = newFrame;
    
}

-(IBAction)shareButtonHit
{
    FinishedViewController *finishedViewController = [[FinishedViewController alloc] initWithNibName:@"FinishedViewController" bundle:nil];
    [self.view addSubview:finishedViewController.view];
}
@end
