//
//  AlvinAction.m
//  Order
//
//  Created by Admin on 9/26/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import "AlvinAction.h"
#import "AlvinActionScrets.h"
#import "AlvinArt.h"

#import "AlvinBlockAction.h"
#import "AlvinSelectorAction.h"
#import "AlvinSleepAction.h"
#import "AlvinQueueAction.h"
#import "AlvinRepeatAction.h"

@implementation AlvinAction

#pragma mark -
#pragma mark Initialization

+(AlvinAction *)runBlock:(dispatch_block_t)block
{
    return [[AlvinBlockAction alloc] initWithBlock:block];
}

+(AlvinAction *)performSelector:(SEL)selector onTarget:(id)target
{
    return [[AlvinSelectorAction alloc] initWithTarget:target andSelector:selector];
}

+(AlvinAction *)waitForDuration:(NSTimeInterval)duration
{
    return [[AlvinSleepAction alloc] initWithDuration:duration];
}

+(AlvinAction *)waitForDuration:(NSTimeInterval)duration withRange:(NSTimeInterval)durationRange
{
    return [[AlvinSleepAction alloc] initWithDuration:duration andRange:durationRange];
}

+(AlvinAction *)repeatAction:(AlvinAction *)action count:(NSUInteger)count
{
    return [[AlvinRepeatAction alloc] initWithAction:action count:count];
}

+(AlvinAction *)sequence:(NSArray *)actions
{
    return [[AlvinQueueAction alloc] initWithActions:actions];
}

#pragma mark -
#pragma mark Secrets

-(void)runActionOnArt:(AlvinArt *)art
{
}

@end
