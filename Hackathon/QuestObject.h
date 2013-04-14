//
//  QuestObject.h
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface QuestObject : NSObject
{
    CLLocation *startPosition;
    CLLocation *endPosition;
    NSMutableArray *questObjects;
    NSMutableArray *receivedQuestObjects;
    
}

+(QuestObject *)getSharedQuestObject;
+(void)createQuestObjectWithStartLocation:(CLLocation *)theStartLocation endLocation:(CLLocation *)theEndLocation;
-(void)addReceivedQuestObject:(id)obj;

@property (nonatomic, retain) CLLocation *startPosition;
@property (nonatomic, retain) CLLocation *endPosition;
@property (nonatomic, retain) NSMutableArray *questObjects;
@property (nonatomic, retain) NSMutableArray *receivedQuestObjects;

@end
