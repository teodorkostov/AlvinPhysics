//
//  AlvinView.m
//  ChipmunkTest
//
//  Created by Admin on 9/25/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import "AlvinView.h"
#import "AlvinScene.h"

@implementation AlvinView

-(void)presentScene:(AlvinScene *)scene
{
    [self.scene removeFromSuperview];
    _scene = scene;
    [self addSubview:self.scene];
}

@end
