//
//  AlvinArt.m
//  ChipmunkTest
//
//  Created by Admin on 9/22/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import "AlvinArt.h"
#import "AlvinPhysicsBody.h"
#import "AlvinPhysicsBodySecrets.h"
#import "AlvinArtSecrets.h"
#import "AlvinAction.h"
#import "AlvinActionScrets.h"
#import "AlvinScene.h"
#import "AlvinPhysicsWorld.h"
#import "AlvinPhysicsWorldSecrets.h"



@interface AlvinArt ()

@property (readonly) NSOperationQueue* actions;

@end



@implementation AlvinArt

#pragma mark -
#pragma mark Properties

-(AlvinScene *)getScene
{
    return (AlvinScene*)self.superview;
}

-(void)setPhysicsBody:(AlvinPhysicsBody *)physicsBody
{
    CGFloat angle = [self.physicsBody angle];
    CGPoint position = [self.physicsBody position];
    
    [self.physicsBody removeFromWorld];
    _physicsBody = physicsBody;
    
    self.physicsBody.angle = angle;
    self.physicsBody.position = position;
    
    if (self.scene)
    {
        [self.scene.physicsWorld addBody:self.physicsBody];
    }
}

-(void)setCenter:(CGPoint)center
{
    if (self.physicsBody)
    {
        self.physicsBody.position = center;
        [self updateTransform];
    }
}

-(CGPoint)center
{
    return CGPointApplyAffineTransform(CGPointZero, self.transform);
}

#pragma mark -
#pragma mark Initialization

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self alignWithPhysics];

        self.backgroundColor = [UIColor clearColor];
        
        _actions = [[NSOperationQueue alloc] init];
        self.actions.maxConcurrentOperationCount = 1;
    }
    
    return self;
}

#pragma mark -
#pragma mark Actions

-(void)runAction:(AlvinAction *)action
{
    if (NO == self.scene.pauseActions)
    {
        if (action.cancelsPreviousActions)
        {
            [self.actions cancelAllOperations];
        }
        
        NSInvocationOperation* operation = [[NSInvocationOperation alloc] initWithTarget:action selector:@selector(runActionOnArt:) object:self];
        [self.actions addOperation:operation];
    }
}

#pragma mark -
#pragma mark Secrets

-(void)updateTransform
{
    if (nil != self.physicsBody)
    {
        self.transform = self.physicsBody.transform;
    }
}

-(void)alignWithPhysics
{
    [super setCenter:CGPointZero];
}

@end
