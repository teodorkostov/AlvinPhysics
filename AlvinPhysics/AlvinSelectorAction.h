//
//  AlvinSelectorAction.h
//  Order
//
//  Created by Admin on 9/26/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import "AlvinAction.h"

@interface AlvinSelectorAction : AlvinAction

-(instancetype)initWithTarget:(id)target andSelector:(SEL)selector;
//-(instancetype)initWithTarget:(id)target selector:(SEL)selector andDelay:(NSTimeInterval)delay;

@end
