//
//  QuestObject.m
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "QuestObject.h"

@implementation QuestObject

@synthesize startPosition;
@synthesize endPosition;
@synthesize questObjects;
@synthesize receivedQuestObjects;

static QuestObject *theSharedQuestObject;

+(QuestObject *)getSharedQuestObject
{
    return theSharedQuestObject;
}


+(void)createQuestObjectWithStartLocation:(CLLocation *)theStartLocation endLocation:(CLLocation *)theEndLocation withQuestObjects:(NSArray *)theQuestObjects
{
    theSharedQuestObject = [[[QuestObject alloc] init] retain];
    
    theSharedQuestObject.startPosition = theStartLocation;
    theSharedQuestObject.endPosition = theEndLocation;
    theSharedQuestObject.questObjects = [[NSMutableArray alloc] initWithArray:theQuestObjects];
    theSharedQuestObject.receivedQuestObjects = [[NSMutableArray alloc] initWithCapacity:0];
}

-(void)addReceivedQuestObject:(id)obj
{
    [self.receivedQuestObjects addObject:obj];
}

//Brooklyn Bridge Park
//Latitude: 40.70443484470314
//Longitude: -73.99009639404154




@end
