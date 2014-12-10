//
//  AlvinView.h
//  ChipmunkTest
//
//  Created by Admin on 9/25/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AlvinScene;

@interface AlvinView : UIView

@property (readonly) AlvinScene* scene;

-(void)presentScene:(AlvinScene*)scene;

@end
