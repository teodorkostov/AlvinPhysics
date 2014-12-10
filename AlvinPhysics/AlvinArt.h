//
//  AlvinArt.h
//  ChipmunkTest
//
//  Created by Admin on 9/22/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AlvinPhysicsBody;
@class AlvinAction;
@class AlvinScene;

@interface AlvinArt : UIView

@property (nonatomic) AlvinPhysicsBody* physicsBody;
@property (readonly, getter=getScene) AlvinScene* scene;
@property NSString* name;

-(void)runAction:(AlvinAction*)action;

@end
