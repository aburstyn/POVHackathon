//
//  HomeViewController.h
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplashViewController.h"
#import "LoginViewController.h"
#import "TakePhotoViewController.h"
#import "MediaPlayerViewController.h"

@interface HomeViewController : UIViewController
{
    SplashViewController *splashViewController;
    LoginViewController *loginViewController;
    TakePhotoViewController *takePhotoViewController;
    MediaPlayerViewController *mediaPlayerViewController;
}


+(HomeViewController *)sharedHomeViewController;

-(void)splashViewComplete;
-(void)loginViewComplete;
-(void)takePhotoViewComplete;


@property (nonatomic, retain) SplashViewController *splashViewController;
@property (nonatomic, retain) LoginViewController *loginViewController;
@property (nonatomic, retain) TakePhotoViewController *takePhotoViewController;
@property (nonatomic, retain) MediaPlayerViewController *mediaPlayerViewController;

@end
