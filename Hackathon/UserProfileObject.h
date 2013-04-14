//
//  UserProfileObject.h
//  Hackathon
//
//  Created by Josh Klobe on 4/14/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserProfileObject : NSObject
{
    UIImage *userImage;
}

+(UserProfileObject *)getSharedProfileObject;

@property (nonatomic, retain) UIImage *userImage;

@end
