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


@interface MediaPlayerViewController ()

@end

@implementation MediaPlayerViewController

@synthesize uip, player, playerImageView, currentCount;


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
    self.uip.view.frame = CGRectMake(-550,-5,700,310);
    
    //  [UIView beginAnimations:nil context:nil];
    //    [UIView setAnimationDuration:.35];
    self.uip.view.frame = CGRectMake(000,self.uip.view.frame.origin.y,self.uip.view.frame.size.width,self.uip.view.frame.size.height);
    //    [UIView commitAnimations];
    
    
    
    
    
    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    playButton.frame = CGRectMake(50,50,100,50);
    [playButton setTitle:@"Play" forState:UIControlStateNormal];
    [playButton addTarget:self action:@selector(playMovie:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playButton];
    
    /*
     UIButton *done = [UIButton buttonWithType:UIButtonTypeRoundedRect];
     done.frame = CGRectMake(50,50,100,50);
     [done setTitle:@"Done" forState:UIControlStateNormal];
     [done addTarget:self action:@selector(doneMovie:) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:done];
     */
}

-(IBAction)playMovie:(id)sender
{
    
    self.currentCount = 0;
    
    self.playerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.playerImageView];
    
    [NSTimer scheduledTimerWithTimeInterval:1/29.97 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Viper01_Audio" ofType:@"aif"];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath: soundPath], &soundID);
    AudioServicesPlaySystemSound (soundID);
    
}
-(void)timerFired:(NSTimer *)theTimer
{
    
    self.currentCount++;
    if (self.currentCount <= 832)
    {
        NSString *numberString = nil;
        if (self.currentCount < 10)
            numberString = [NSString stringWithFormat:@"00%d", self.currentCount];
        else if (self.currentCount < 100)
            numberString = [NSString stringWithFormat:@"0%d", self.currentCount];
        else
            numberString = [NSString stringWithFormat:@"%d", self.currentCount];
        
        NSString *imageFilename = [NSString stringWithFormat:@"Viper1Alpha_520X320 %@.png", numberString];
        self.playerImageView.image = [UIImage imageNamed:imageFilename];
    }
    else
    {
        [theTimer invalidate];
        [self.playerImageView removeFromSuperview];
    }
}

-(void)doneMovie
{
    
}


-(IBAction)playMovie2:(id)sender
{
    //    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"Viper1Alpha_520X320" ofType:@"mov"];
    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"First Response" ofType:@"mov"];
    
    /*
     NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
     MPMoviePlayerController *moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
     moviePlayerController.view.frame = CGRectMake(100,100,200,200);
     [self.view addSubview:moviePlayerController.view];
     moviePlayerController.fullscreen = YES;
     [moviePlayerController play];
     */
    
    
    //    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"Viper1Alpha_520X320" ofType:@"mov"];
    
    UIView *theView = [[UIView alloc] initWithFrame:CGRectMake(200,1,200,200)];
    theView.alpha = .45;
    theView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:theView];
    
    
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
    AVPlayerItem *playerItem = [[AVPlayerItem playerItemWithURL:fileURL] retain];
    
    NSLog(@"playerItem: %@", playerItem);
    NSLog(@"playerItem.duration: %f", CMTimeGetSeconds([playerItem duration]));
    self.player = [[AVPlayer alloc] initWithPlayerItem:playerItem];
    
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    [theView.layer addSublayer:playerLayer];
    playerLayer.frame = CGRectMake(0,0, theView.frame.size.width, theView.frame.size.height);
    [self.player play];
    
    NSLog(@"playerLayer.frame: %@", NSStringFromCGRect(playerLayer.frame));
    NSLog(@"self.view.layer: %@", self.view.layer);
    /*
     AVPlayerLayer *avPlayerLayer = [[AVPlayerLayer playerLayerWithPlayer:player] retain];
     avPlayerLayer.frame = CGRectMake(0,0,100,100);
     [self.view.layer addSublayer:avPlayerLayer];
     [self.view addSubview:newView];
     [player play];
     
     
     
     //    moviePlayerController.view.alpha = .85;
     
     [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
     
     */
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

