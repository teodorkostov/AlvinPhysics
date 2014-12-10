//
//  AlvinScene.m
//  ChipmunkTest
//
//  Created by Admin on 9/22/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import "AlvinScene.h"
#import "AlvinArt.h"
#import "AlvinArtSecrets.h"
#import "AlvinPhysicsWorld.h"
#import "AlvinPhysicsWorldSecrets.h"



@interface AlvinScene ()

@property (readonly) CADisplayLink* link;
@property (readonly) NSMutableSet* artGallery;

@end



@implementation AlvinScene

#pragma mark -
#pragma mark Properties

-(AlvinScene *)getScene
{
    return self;
}

-(NSSet *)getArt
{
    return [NSSet setWithSet:self.artGallery];
}

-(void)setPausePhysics:(BOOL)pausePhysics
{
    _pausePhysics = pausePhysics;
    self.link.paused = pausePhysics;
}

-(void)setPaused:(BOOL)paused
{
    self.pausePhysics = paused;
    self.pauseActions = paused;
}

-(BOOL)paused
{
    return self.pausePhysics && self.pauseActions;
}

#pragma mark -
#pragma mark Initialization

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _artGallery = [NSMutableSet set];
        _physicsWorld = [AlvinPhysicsWorld world];
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(linkUpdate:)];
        self.pausePhysics = YES;
        [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return self;
}

-(void)dealloc
{
    [self.link invalidate];
}

#pragma mark -
#pragma mark View management

-(void)addSubview:(UIView *)view
{
    if (YES == [view isKindOfClass:[AlvinArt class]])
    {
        AlvinArt* art = (AlvinArt*)view;
        [self.artGallery addObject:art];
        [self.physicsWorld addBody:art.physicsBody];
    }
    [super addSubview:view];
}

-(void)willRemoveSubview:(UIView *)subview
{
    if (YES == [subview isKindOfClass:[AlvinArt class]])
    {
        AlvinArt* art = (AlvinArt*)subview;
        [self.artGallery removeObject:art];
        [self.physicsWorld removeBody:art.physicsBody];
    }
}

#pragma mark -
#pragma mark Physics management

-(void)didMoveToSuperview
{
    if (nil == self.superview) self.pausePhysics = YES;
    else self.pausePhysics = NO;
}

-(void)removeFromSuperview
{
    self.pausePhysics = YES;
    [super removeFromSuperview];
}

-(void)linkUpdate:(CADisplayLink*)link
{
    // preprocessing hook
    [self update:link.timestamp];
    
    // calculate physics
    [self.physicsWorld updatePhysics:link.duration];
    
    // update graphics
    [self.artGallery makeObjectsPerformSelector:@selector(updateTransform)];
    
    // postprocessing hook
    [self didSimulatePhysics];
}

-(void)updateTransform
{
}

-(void)alignWithPhysics
{
}

#pragma mark -
#pragma mark Delegation

-(void)update:(NSTimeInterval)currentTime
{
}

-(void)didSimulatePhysics
{
}

@end
