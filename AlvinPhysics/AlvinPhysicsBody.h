//
//  AlvinPhysicsBody.h
//  ChipmunkTest
//
//  Created by Admin on 9/22/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjectiveChipmunk.h"

@interface AlvinPhysicsBody : NSObject <ChipmunkObject>

+(instancetype)bodyWithCircleOfRadius:(CGFloat)radius;
+(instancetype)bodyWithRectangleOfSize:(CGSize)size;
+(instancetype)bodyWithRectangleOfSize:(CGSize)size center:(CGPoint)center;

+(instancetype)staticBodyWithCircleOfRadius:(CGFloat)radius;
+(instancetype)staticBodyWithRectangleOfSize:(CGSize)size;
+(instancetype)staticBodyWithRectangleOfSize:(CGSize)size center:(CGPoint)center;

+(instancetype)bodyWithEdgeLoopFromRect:(CGRect)rect;

@property (readonly) NSArray* chipmunkObjects;

@end
