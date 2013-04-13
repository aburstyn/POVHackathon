//
//  MediaPlayerViewController.m
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "MediaPlayerViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface MediaPlayerViewController ()

@end

@implementation MediaPlayerViewController

@synthesize uip;


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
    
}

-(IBAction)playMovie:(id)sender
{
    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"sample_sorenson" ofType:@"mov"];
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
    MPMoviePlayerController *moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    moviePlayerController.view.frame = CGRectMake(100,100,200,200);
    [self.view addSubview:moviePlayerController.view];
    moviePlayerController.fullscreen = NO;
    [moviePlayerController play];
    
    
    moviePlayerController.view.alpha = .85;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
