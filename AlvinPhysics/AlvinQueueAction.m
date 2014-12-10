//
//  AlvinQueueAction.m
//  Order
//
//  Created by Admin on 9/26/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import "AlvinQueueAction.h"
#import "AlvinActionScrets.h"
#import "AlvinArt.h"



@interface AlvinQueueAction ()

@property (readonly) NSArray* actions;

@end



@implementation AlvinQueueAction

-(instancetype)initWithActions:(NSArray *)actions
{
    NSAssert(0 < [actions count], @"A valid number of actions is required.");
    
    self = [super init];
    
    if (self)
    {
        _actions = actions;
    }
    
    return self;
}

-(void)runActionOnArt:(AlvinArt *)art
{
    for (AlvinAction* action in self.actions)
    {
        [action runActionOnArt:art];
    }
}

@end
