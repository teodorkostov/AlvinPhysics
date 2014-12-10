//
//  AlvinSleepAction.m
//  Order
//
//  Created by Admin on 9/26/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import "AlvinSleepAction.h"
#import "AlvinActionScrets.h"
#import "AlvinArt.h"



#define ARC4RANDOM_MAX 0x100000000



@interface AlvinSleepAction ()

@property (readonly) NSTimeInterval napTime;

@end



@implementation AlvinSleepAction

-(instancetype)initWithDuration:(NSTimeInterval)duration
{
    self = [super init];
    
    if (self)
    {
        _napTime = duration;
    }
    
    return self;
}

-(instancetype)initWithDuration:(NSTimeInterval)duration andRange:(NSTimeInterval)durationRange
{
    self = [super init];
    
    if (self)
    {
        double uniformValue = (double)arc4random() / (double)ARC4RANDOM_MAX;
        NSTimeInterval extraTime = uniformValue * durationRange;
        _napTime = duration + extraTime;
    }
    
    return self;
}

-(void)runActionOnArt:(AlvinArt *)art
{
    [NSThread sleepForTimeInterval:self.napTime];
}

@end
