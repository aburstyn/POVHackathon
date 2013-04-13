//
//  LoginViewController.m
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"
#import "AppDelegate.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize usernameTextField;
@synthesize passwordTextField;

@synthesize loginFirstView;

@synthesize loginSecondView;
@synthesize selectedUserImageView;

@synthesize photoImagePicker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)signupButtonHit
{
    AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [del.homeViewController loginViewComplete];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"self.loginFirstView: %@", self.loginFirstView);
    [self.view addSubview:self.loginFirstView];
}


-(IBAction)createPlayerButtonHit
{
    [self.view addSubview:self.loginSecondView];
}

-(IBAction)playUsingFacebookButtonHit
{
    
}

-(IBAction)photoButtonHit
{
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        self.photoImagePicker = [[UIImagePickerController alloc] init];
        self.photoImagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.photoImagePicker.showsCameraControls = YES;
        self.photoImagePicker.delegate = self;
        CGRect frame = photoImagePicker.view.frame;
        frame.origin.y += 30;
        frame.size.height -= 30;
        self.photoImagePicker.view.frame = frame;
        [self.view addSubview:self.photoImagePicker.view];
        
        self.photoImagePicker.view.transform = CGAffineTransformMakeRotation(-3.141592/2);
        self.photoImagePicker.view.frame = CGRectMake(580,-5,580,310);
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:.35];
        self.photoImagePicker.view.frame = CGRectMake(0,self.photoImagePicker.view.frame.origin.y,self.photoImagePicker.view.frame.size.width,self.photoImagePicker.view.frame.size.height);
        [UIView commitAnimations];
        
        
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"didFinishPickingMediaWithInfo: %@", info);
    
    self.selectedUserImageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];

    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.35];
    self.photoImagePicker.view.frame = CGRectMake(580,00,self.photoImagePicker.view.frame.size.width,self.photoImagePicker.view.frame.size.height);
    [UIView commitAnimations];
    
}

@end
