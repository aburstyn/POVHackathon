//
//  LoginViewController.h
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface LoginViewController : UIViewController
{
    
    
    UITextField *usernameTextField;
    UITextField *passwordTextField;
    
    UIView *loginFirstView;
    
    UIView *loginSecondView;
    UIImageView *selectedUserImageView;
    
    UIImagePickerController *photoImagePicker;
}

-(IBAction)createPlayerButtonHit;
-(IBAction)playUsingFacebookButtonHit;

-(IBAction)signupButtonHit;

-(IBAction)photoButtonHit;

-(IBAction)secondViewNextButtonHit;

@property (nonatomic, retain) IBOutlet UITextField *usernameTextField;
@property (nonatomic, retain) IBOutlet UITextField *passwordTextField;

@property (nonatomic, retain) IBOutlet UIView *loginFirstView;

@property (nonatomic, retain) IBOutlet UIView *loginSecondView;
@property (nonatomic, retain) IBOutlet UIImageView *selectedUserImageView;

@property (nonatomic, retain) IBOutlet UIImagePickerController *photoImagePicker;
@end

