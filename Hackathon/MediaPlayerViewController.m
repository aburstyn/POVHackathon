//
//  MediaPlayerViewController.m
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "MediaPlayerViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "VulerabilityViewController.h"

@interface MediaPlayerViewController ()

@end

@implementation MediaPlayerViewController

@synthesize uip, player, playerImageView, currentCount, screengrabImage;

static inline double radians (double degrees) {return degrees * M_PI/180;}

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
    
    self.view.backgroundColor = [UIColor blackColor];
    
    UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(0,0,550,400)];
    [self.view addSubview:blackView];
    
    self.uip = [[UIImagePickerController alloc] init];
    self.uip.sourceType =
    UIImagePickerControllerSourceTypeCamera;
    self.uip.showsCameraControls = NO;
    CGRect frame = self.uip.view.frame;
    frame.origin.y += 30;
    frame.size.height -= 30;
    self.uip.view.frame = frame;
    self.uip.view.alpha = .5;
    [self.view addSubview:self.uip.view];
    
    self.uip.view.transform = CGAffineTransformMakeRotation(-3.141592/2);
    self.uip.view.frame = CGRectMake(-550,4,700,310);
    self.uip.view.frame = CGRectMake(000,self.uip.view.frame.origin.y,self.uip.view.frame.size.width,self.uip.view.frame.size.height);
    
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(playMovie:) userInfo:nil repeats:NO];
}

-(IBAction)playMovie:(id)sender
{
    
    self.currentCount = 0;
    
    if (self.playerImageView != nil)
    {
        [self.playerImageView removeFromSuperview];
        [self.playerImageView release];
        self.playerImageView = nil;
        
    }
    self.playerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 18, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.playerImageView];
    self.playerImageView.alpha = 0;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:3.5];
    self.playerImageView.alpha = 1;
    [UIView commitAnimations];
    
    
    [NSTimer scheduledTimerWithTimeInterval:1/29.97 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"ChetAudio_041413_1-2" ofType:@"aif"];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath: soundPath], &soundID);
    AudioServicesPlaySystemSound (soundID);
    
}
-(void)timerFired:(NSTimer *)theTimer
{
    
    
    
    if (self.currentCount == 100)
    {
        CGImageRef screen = UIGetScreenImage();
        UIImage* image = [UIImage imageWithCGImage:screen];
        CGImageRelease(screen);
        
        self.screengrabImage = image;
    }
    if (self.currentCount < 783)
    {
        
        NSString *numberString = nil;
        if (self.currentCount < 10)
            numberString = [NSString stringWithFormat:@"0000%d", self.currentCount];
        else if (self.currentCount < 100)
            numberString = [NSString stringWithFormat:@"000%d", self.currentCount];
        else
            numberString = [NSString stringWithFormat:@"00%d", self.currentCount];
        
        NSString *imageFilename = [NSString stringWithFormat:@"ChetAlpha_520X320_%@.png", numberString];
        
        UIImage *theImage = [UIImage imageNamed:imageFilename];
        self.playerImageView.image = theImage;
        [theImage release];
    }
    else
    {
        [theTimer invalidate];
        
        UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(-200, -200, 800,800)];
        blackView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:blackView];
        
        
        NSString *imageFilename = [NSString stringWithFormat:@"Viper1Alpha_520X320 %@.png", @"832"];
        
        UIImage *theImage = [UIImage imageNamed:imageFilename];
        self.playerImageView.image = theImage;
        
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1.5];
        self.playerImageView.alpha = 0;
        [UIView commitAnimations];
        
      
        VulerabilityViewController *vulerabilityViewController = [[VulerabilityViewController alloc] initWithNibName:@"VulerabilityViewController" bundle:nil];
        vulerabilityViewController.view.alpha = 0;
        [self.view addSubview:vulerabilityViewController.view];
        vulerabilityViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1.5];
        vulerabilityViewController.view.alpha = 1;
        [UIView commitAnimations];
        

        self.screengrabImage = [[UIImage alloc] initWithCGImage: self.screengrabImage.CGImage
                                                             scale: 1.0
                                                       orientation: UIImageOrientationLeft];
        
        vulerabilityViewController.screenGrabImageView.image = self.screengrabImage;
    }
    
    self.currentCount++;
    
}


-(void)doneMovie:(id)sender
{
    NSLog(@"doneMovie");
}

-(void)imageViewDidFade
{
    [self.playerImageView removeFromSuperview];
    [self.playerImageView release];
    self.playerImageView = nil;
}

@end

