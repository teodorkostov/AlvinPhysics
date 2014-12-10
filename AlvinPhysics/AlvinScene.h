//
//  AlvinScene.h
//  ChipmunkTest
//
//  Created by Admin on 9/22/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import "AlvinArt.h"
@class AlvinPhysicsWorld;

@interface AlvinScene : AlvinArt

@property (readonly) AlvinPhysicsWorld* physicsWorld;
@property (readonly, getter=getArt) NSSet* allArt;
@property (nonatomic) BOOL paused;
@property (nonatomic) BOOL pausePhysics;
@property (nonatomic) BOOL pauseActions;
@property NSMutableDictionary* userData;

-(void)update:(NSTimeInterval)currentTime;
-(void)didSimulatePhysics;

@end
