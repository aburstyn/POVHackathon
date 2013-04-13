//
//  TakePhotoViewController.h
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/UTCoreTypes.h>



@interface TakePhotoViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UIButton *theButton;
    UIImageView *photoImageView;
    UIImagePickerController *uip;
}

-(IBAction)takePhotoButtonHit;

@property (nonatomic, retain) IBOutlet UIButton *theButton;
@property (nonatomic, retain) IBOutlet UIImageView *photoImageView;
@property (nonatomic, retain) UIImagePickerController *uip;
@end
