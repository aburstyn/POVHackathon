//
//  MediaPlayerViewController.h
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <AVFoundation/AVFoundation.h>

@interface MediaPlayerViewController : UIViewController
{
    UIImagePickerController *uip;
    AVPlayer *player;
    UIImageView *playerImageView;
    
    int currentCount;
    
    UIImage *screengrabImage;
}

-(IBAction)playMovie:(id)sender;


@property (nonatomic, retain) UIImagePickerController *uip;
@property (nonatomic, retain) AVPlayer *player;
@property (nonatomic, retain) UIImageView *playerImageView;

@property (nonatomic, assign) int currentCount;

@property (nonatomic, retain) UIImage *screengrabImage;
@end
