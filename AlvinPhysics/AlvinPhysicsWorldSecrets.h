//
//  AlvinPhysicsWorldSecrets.h
//  ChipmunkTest
//
//  Created by Admin on 9/22/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

@class AlvinPhysicsBody;

@interface AlvinPhysicsWorld (Secrets)

-(void)updatePhysics:(NSTimeInterval)delta;
-(void)addBody:(AlvinPhysicsBody*)body;
-(void)removeBody:(AlvinPhysicsBody*)body;

@end
