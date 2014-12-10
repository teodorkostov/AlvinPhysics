//
//  AlvinRepeatAction.m
//  Order
//
//  Created by Admin on 9/26/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import "AlvinRepeatAction.h"
#import "AlvinActionScrets.h"
#import "AlvinArt.h"



@interface AlvinRepeatAction ()

@property (readonly) AlvinAction* action;
@property (readonly) NSUInteger count;
@property (readonly) BOOL repeatForever;

@end



@implementation AlvinRepeatAction

-(instancetype)initWithAction:(AlvinAction *)action count:(NSUInteger)count
{
    NSAssert(nil != action, @"Needs valid action");
    
    self = [super init];
    
    if (self)
    {
        _action = action;
        _count = count;
    }
    
    return self;
}

-(void)runActionOnArt:(AlvinArt *)art
{
    for (NSUInteger repeatIndex = 0; repeatIndex < self.count; repeatIndex++)
    {
        [self.action runActionOnArt:art];
    }
}

@end
