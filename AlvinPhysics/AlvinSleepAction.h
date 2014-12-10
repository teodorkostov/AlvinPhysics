//
//  AlvinSleepAction.h
//  Order
//
//  Created by Admin on 9/26/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import "AlvinAction.h"

@interface AlvinSleepAction : AlvinAction

-(instancetype)initWithDuration:(NSTimeInterval)duration;
-(instancetype)initWithDuration:(NSTimeInterval)duration andRange:(NSTimeInterval)durationRange;

@end
