//
//  IndexTouchView.m
//  Hackathon
//
//  Created by Josh Klobe on 4/14/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "IndexTouchView.h"
#import "VulerabilityViewController.h"
@implementation IndexTouchView

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *theTouch = [[touches allObjects] objectAtIndex:0];
    float xOffset = [theTouch locationInView:self].x;
    
    [delegate touchMovedWithXPos:xOffset];
    
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *theTouch = [[touches allObjects] objectAtIndex:0];
    float xOffset = [theTouch locationInView:self].x;    
    [delegate touchMovedWithXPos:xOffset];

    [super touchesMoved:touches withEvent:event];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

    [super touchesEnded:touches withEvent:event];
}



@end
