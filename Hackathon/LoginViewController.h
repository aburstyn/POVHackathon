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
}

-(IBAction)signupButtonHit;
@property (nonatomic, retain) IBOutlet UITextField *usernameTextField;
@property (nonatomic, retain) IBOutlet UITextField *passwordTextField;

@property (nonatomic, retain) IBOutlet UIView *loginFirstView;

@end

