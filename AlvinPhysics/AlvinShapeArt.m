//
//  AlvinShapeArt.m
//  ChipmunkTest
//
//  Created by Admin on 9/25/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import "AlvinShapeArt.h"

@implementation AlvinShapeArt

#pragma mark -
#pragma mark Properties

-(void)setPath:(CGPathRef)path
{
    if (self.path != path)
    {
        CGPathRelease(self.path);
        _path = CGPathRetain(path);
        
        [self setNeedsDisplay];
    }
}

-(void)translatePathToCenter
{
    CGAffineTransform translate = CGAffineTransformMakeTranslation(self.frame.size.width/2, self.frame.size.height/2);
    self.path = CGPathCreateCopyByTransformingPath(self.path, &translate);
}

-(void)setFillColor:(UIColor *)fillColor
{
    if (nil != fillColor && NO == [self.fillColor isEqual:fillColor])
    {
        _fillColor = fillColor;
        [self setNeedsDisplay];
    }
}

-(void)setStrokeColor:(UIColor *)strokeColor
{
    if (nil != strokeColor && NO == [self.strokeColor isEqual:strokeColor])
    {
        _strokeColor = strokeColor;
        [self setNeedsDisplay];
    }
}

-(void)setLineWidth:(CGFloat)lineWidth
{
    if (self.lineWidth != lineWidth)
    {
        _lineWidth = lineWidth;
        [self setNeedsDisplay];
    }
}

#pragma mark -
#pragma mark Initialization

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.lineWidth = 1;
    }
    
    return self;
}

-(void)dealloc
{
    CGPathRelease(self.path);
}

#pragma mark -
#pragma mark Drawing

-(void)drawRect:(CGRect)rect
{
    if (nil == self.path) return;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (nil != self.fillColor)
    {
        CGContextSetFillColorWithColor(context, [self.fillColor CGColor]);
        CGContextAddPath(context, self.path);
        CGContextFillPath(context);
    }
    
    if (nil != self.strokeColor)
    {
        CGContextSetStrokeColorWithColor(context, [self.strokeColor CGColor]);
        CGContextSetLineWidth(context, self.lineWidth);
        CGContextAddPath(context, self.path);
        CGContextStrokePath(context);
    }
}

@end
