//
//  AlvinShapeArt.h
//  ChipmunkTest
//
//  Created by Admin on 9/25/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import "AlvinArt.h"

@interface AlvinShapeArt : AlvinArt

@property (nonatomic) CGPathRef path;
@property (nonatomic) CGFloat lineWidth;
@property (nonatomic) UIColor* fillColor;
@property (nonatomic) UIColor* strokeColor;

-(void)translatePathToCenter;

@end
