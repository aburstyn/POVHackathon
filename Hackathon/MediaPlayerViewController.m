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

-(IBAction)playMovie:(id)sender
{
    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"sample_sorenson" ofType:@"mov"];
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
    MPMoviePlayerController *moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    moviePlayerController.view.frame = CGRectMake(100,100,100,100);
    moviePlayerController.view.alpha = .5;
    [self.view addSubview:moviePlayerController.view];
    moviePlayerController.fullscreen = NO;
    [moviePlayerController play];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
