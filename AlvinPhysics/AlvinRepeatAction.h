//
//  AlvinRepeatAction.h
//  Order
//
//  Created by Admin on 9/26/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import "AlvinAction.h"

@interface AlvinRepeatAction : AlvinAction

-(instancetype)initWithAction:(AlvinAction*)action count:(NSUInteger)count;

@end
