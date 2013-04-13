//
//  MediaPlayerViewController.h
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/UTCoreTypes.h>

@interface MediaPlayerViewController : UIViewController
{
    UIImagePickerController *uip;    
}

-(IBAction)playMovie:(id)sender;


@property (nonatomic, retain) UIImagePickerController *uip;
@end
