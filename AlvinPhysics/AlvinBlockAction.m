//
//  AlvinBlockAction.m
//  Order
//
//  Created by Admin on 9/26/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import "AlvinBlockAction.h"
#import "AlvinActionScrets.h"
#import "AlvinArt.h"



@interface AlvinBlockAction ()

@property (readonly) dispatch_block_t block;

@end



@implementation AlvinBlockAction

-(instancetype)initWithBlock:(dispatch_block_t)block
{
    NSAssert(nil != block, @"Block has to be valid.");
    
    self = [super init];
    
    if (self)
    {
        _block = block;
    }
    
    return self;
}

-(void)runActionOnArt:(AlvinArt *)art
{
    self.block();
}

@end
