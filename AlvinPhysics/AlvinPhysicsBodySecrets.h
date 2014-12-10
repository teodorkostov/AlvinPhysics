//
//  AlvinPhysicsBodySecrets.h
//  ChipmunkTest
//
//  Created by Admin on 9/23/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

@interface AlvinPhysicsBody (Secrets)

/// The affine transformation based on the physical changes of the body.
@property (readonly, getter=getTransform) CGAffineTransform transform;
@property (nonatomic) CGFloat angle;
@property (nonatomic) CGPoint position;

/// A convenience method to remove a body from the world.
-(void)removeFromWorld;

@end
