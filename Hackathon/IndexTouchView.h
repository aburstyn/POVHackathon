//
//  IndexTouchView.h
//  Hackathon
//
//  Created by Josh Klobe on 4/14/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VulerabilityViewController;
@interface IndexTouchView : UIView
{
    VulerabilityViewController *delegate;
    
}

@property (nonatomic, retain) VulerabilityViewController *delegate;

@end
