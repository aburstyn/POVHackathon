//
//  TakePhotoViewController.m
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "TakePhotoViewController.h"
#import "AppDelegate.h"


@interface TakePhotoViewController ()

@end

@implementation TakePhotoViewController

@synthesize theButton;
@synthesize photoImageView;
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
    self.view.frame = CGRectMake(-40,0,520,320);
    
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(takePhotoButtonHit)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    

      
    NSLog(@"next button");
    
    
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)takePhotoButtonHit
{
    NSLog(@"takePhotoButtonHit");
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        self.uip = [[UIImagePickerController alloc] init];
        self.uip.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.uip.showsCameraControls = YES;
        self.uip.delegate = self;
        CGRect frame = uip.view.frame;
        frame.origin.y += 30;
        frame.size.height -= 30;
        self.uip.view.frame = frame;
        [self.view addSubview:self.uip.view];
        
        self.uip.view.transform = CGAffineTransformMakeRotation(-3.141592/2);
        self.uip.view.frame = CGRectMake(-560,-5,580,310);
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:.35];
        self.uip.view.frame = CGRectMake(0,self.uip.view.frame.origin.y,self.uip.view.frame.size.width,self.uip.view.frame.size.height);
        [UIView commitAnimations];

        
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"didFinishPickingMediaWithInfo: %@", info);
    
    self.photoImageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    

 
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.35];
    self.uip.view.frame = CGRectMake(-580,00,self.uip.view.frame.size.width,self.uip.view.frame.size.height);
    [UIView commitAnimations];

}

-(void)nextButtonHit
{
    AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [del.homeViewController takePhotoViewComplete];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
}



@end
