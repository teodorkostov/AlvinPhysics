//
//  AlvinBlockAction.h
//  Order
//
//  Created by Admin on 9/26/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import "AlvinAction.h"

@interface AlvinBlockAction : AlvinAction

-(instancetype)initWithBlock:(dispatch_block_t)block;

@end
