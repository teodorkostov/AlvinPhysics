//
//  AlvinPhysicsWorld.h
//  ChipmunkTest
//
//  Created by Admin on 9/22/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlvinPhysicsWorld : NSObject

/// Utility method to create a physics world with default parameters.
+(instancetype)world;

/// The gravity force in the world. (Units: m / s^2)
@property (nonatomic) CGVector gravity;

/// The main constant that specifies the relationship between pixels and meters
/// for the physics simulation. (Units: pixel / m)
@property (nonatomic) CGFloat pixelsPerMeter;

@end
