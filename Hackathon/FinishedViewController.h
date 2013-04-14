//
//  FinishedViewController.h
//  Hackathon
//
//  Created by Josh Klobe on 4/14/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FinishedViewController : UIViewController
{
    UIImageView *theImageView;
    
    UIImageView *imageViewOne;
    UIImageView *imageViewTwo;
    UIImageView *imageViewThree;
}

-(IBAction)donateButtonHit;
-(IBAction)volunteerButtonHit;

@property (nonatomic, retain) IBOutlet UIImageView *theImageView;

@property (nonatomic, retain) IBOutlet UIImageView *imageViewOne;
@property (nonatomic, retain) IBOutlet UIImageView *imageViewTwo;
@property (nonatomic, retain) IBOutlet UIImageView *imageViewThree;

@end
