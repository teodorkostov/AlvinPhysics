//
//  AlvinAction.h
//  Order
//
//  Created by Admin on 9/26/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlvinAction : NSObject

//-(instancetype)init __attribute__((unavailable("AlvinAction cannot be created directly.")));

+(AlvinAction*)repeatAction:(AlvinAction*)action count:(NSUInteger)count;

+(AlvinAction*)sequence:(NSArray *)actions;

+(AlvinAction*)runBlock:(dispatch_block_t)block;

+(AlvinAction*)performSelector:(SEL)selector onTarget:(id)target;

+(AlvinAction*)waitForDuration:(NSTimeInterval)duration;
+(AlvinAction*)waitForDuration:(NSTimeInterval)duration withRange:(NSTimeInterval)durationRange;

@property BOOL cancelsPreviousActions;

@end
