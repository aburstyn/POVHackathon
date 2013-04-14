//
//  VulerabilityViewController.h
//  Hackathon
//
//  Created by Josh Klobe on 4/14/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IndexTouchView.h"
@interface VulerabilityViewController : UIViewController
{
    UILabel *howLabel;
    
    IndexTouchView *indexTouchView;
    
    UIImageView *indexBarView;
    
    UIImage *screenGrabImage;
    
    UIImageView *screenGrabImageView;
}

-(void)touchMovedWithXPos:(float)xPos;
-(IBAction)shareButtonHit;

@property (nonatomic, retain) IBOutlet UILabel *howLabel;
@property (nonatomic, retain) IBOutlet IndexTouchView *indexTouchView;

@property (nonatomic, retain) UIImageView *indexBarView;

@property (nonatomic, retain) UIImage *screenGrabImage;

@property (nonatomic, retain) IBOutlet UIImageView *screenGrabImageView;

@end
