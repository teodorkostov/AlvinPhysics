//
//  AlvinSelectorAction.m
//  Order
//
//  Created by Admin on 9/26/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import "AlvinSelectorAction.h"
#import "AlvinActionScrets.h"
#import "AlvinArt.h"



@interface AlvinSelectorAction ()

@property (readonly) id target;
@property (readonly) SEL selector;

@end



@implementation AlvinSelectorAction

-(instancetype)initWithTarget:(id)target andSelector:(SEL)selector
{
    NSAssert(nil != target, @"Target has to be valid.");
    NSAssert(nil != selector, @"Selector has to be valid.");
    
    self = [super init];
    
    if (self)
    {
        _selector = selector;
        _target = target;
    }
    
    return self;
}

-(void)runActionOnArt:(AlvinArt *)art
{
    [self.target performSelectorOnMainThread:self.selector withObject:nil waitUntilDone:YES];
}

@end
