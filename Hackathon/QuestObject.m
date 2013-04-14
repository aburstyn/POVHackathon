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


+(void)createQuestObjectWithStartLocation:(CLLocation *)theStartLocation endLocation:(CLLocation *)theEndLocation
{
    theSharedQuestObject = [[[QuestObject alloc] init] retain];
    
    theSharedQuestObject.startPosition = theStartLocation;
    theSharedQuestObject.endPosition = theEndLocation;
    theSharedQuestObject.questObjects = [[NSMutableArray alloc] initWithArray:[self getObjs]];
    theSharedQuestObject.receivedQuestObjects = [[NSMutableArray alloc] initWithCapacity:0];
}

+(NSArray *)getObjs
{


    NSArray *objsArray = 
    [NSArray arrayWithObjects:@"Pillow",
     @"Sheets",
     @"Towel & washcloth",
     @"Comforter",
     @"Set of cups",
     @"Pots & pans",
     @"Dishes",
     @"Alarm clock",
     @"Broom",
     @"Trash can",
     @"Can opener",
     @"Spatula/Big spoon/Measuring cup (ie, cooking utensils)",
     @"Mattress",
     @"Coffee mug",
     @"Flatware",
     @"Lamp",
     @"Pillow",
     @"Sheets",
     @"Towel & washcloth",
     @"Comforter",
     @"Set of cups",
     @"Pots & pans",
     @"Dishes",
     @"Alarm clock",
     @"Broom",
     @"Trash can",
     @"Can opener",
     @"Spatula/Big spoon/Measuring cup (ie, cooking utensils)",
     @"Mattress",
     @"Coffee mug",
     @"Flatware",
     @"Lamp",
     
     nil];
    
    NSMutableArray *ar = [NSMutableArray arrayWithCapacity:0];
    
    [ar addObjectsFromArray:objsArray];
    [ar addObjectsFromArray:objsArray];
    [ar addObjectsFromArray:objsArray];
    [ar addObjectsFromArray:objsArray];
    [ar addObjectsFromArray:objsArray];
    [ar addObjectsFromArray:objsArray];
    [ar addObjectsFromArray:objsArray];
    
    return ar;
}
-(void)addReceivedQuestObject:(id)obj
{
    [self.receivedQuestObjects addObject:obj];
}

//Brooklyn Bridge Park
//Latitude: 40.70443484470314
//Longitude: -73.99009639404154




@end
