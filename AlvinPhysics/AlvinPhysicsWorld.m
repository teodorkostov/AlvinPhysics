//
//  AlvinPhysicsWorld.m
//  ChipmunkTest
//
//  Created by Admin on 9/22/14.
//  Copyright (c) 2014 IC. All rights reserved.
//
//  IMPORTANT: Same coordinate system as UIKit!!!
//

#import "AlvinPhysicsBody.h"
#import "AlvinPhysicsWorld.h"
#import "AlvinPhysicsWorldSecrets.h"
#import "ObjectiveChipmunk.h"


/// This is the default SpriteKit value.
static const CGFloat defaultPPM = 150;
/// The default earth gravity.
static const CGVector defaultGravity = {0, 9.8};



@interface AlvinPhysicsWorld ()

@property (readonly) ChipmunkSpace* space;

@end



@implementation AlvinPhysicsWorld

#pragma mark -
#pragma mark Properties

-(void)setGravity:(CGVector)gravity
{
    if (self.gravity.dx != gravity.dx || self.gravity.dy != gravity.dy)
    {
        _gravity = gravity;
        [self updateWorldParameters];
    }
}

-(void)setPixelsPerMeter:(CGFloat)pixelsPerMeter
{
    if (self.pixelsPerMeter != pixelsPerMeter)
    {
        _pixelsPerMeter = pixelsPerMeter;
        [self updateWorldParameters];
    }
}

#pragma mark -
#pragma mark Initialization

+(instancetype)world
{
    AlvinPhysicsWorld* world = [[self alloc] init];
    return world;
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _space = [[ChipmunkSpace alloc] init];
        
        _pixelsPerMeter = defaultPPM;
        _gravity = defaultGravity;
        [self updateWorldParameters];
    }
    return self;
}

#pragma mark -
#pragma mark Physics management

-(void)updateWorldParameters
{
    self.space.gravity = cpv(self.gravity.dx * self.pixelsPerMeter, self.gravity.dy * self.pixelsPerMeter);
}

#pragma mark -
#pragma mark Secrets

-(void)addBody:(AlvinPhysicsBody *)body
{
    if (nil != body)
    {
//        [self.space addPostStepAddition:body]; // correct way but floods with warnings
        [self.space performSelectorOnMainThread:@selector(smartAdd:) withObject:body waitUntilDone:YES];
    }
}

-(void)removeBody:(AlvinPhysicsBody *)body
{
    if (nil != body)
    {
//        [self.space addPostStepRemoval:body]; // correct way but floods with warnings
        [self.space performSelectorOnMainThread:@selector(smartRemove:) withObject:body waitUntilDone:YES];
    }
}

-(void)updatePhysics:(NSTimeInterval)delta
{
    [self.space step:delta];
}

@end
