//
//  UserProfileObject.m
//  Hackathon
//
//  Created by Josh Klobe on 4/14/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "UserProfileObject.h"

@implementation UserProfileObject


static UserProfileObject *theSharedProfileObject;

@synthesize userImage;


+(UserProfileObject *)getSharedProfileObject
{
    if (theSharedProfileObject == nil)
        theSharedProfileObject = [[UserProfileObject alloc] init];
    
    return theSharedProfileObject;
}



@end
