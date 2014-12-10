//
//  AlvinPhysicsBody.m
//  ChipmunkTest
//
//  Created by Admin on 9/22/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import "AlvinPhysicsBody.h"
#import "AlvinPhysicsBodySecrets.h"



#pragma mark Local Data

static const CGFloat defaultDensity = 1;
static const CGFloat defaultElasticity = 0.2;
static const CGFloat defaultFriction = 0.2;
static const CGFloat defaultThickness = 32;



#pragma mark Local Functionality

static ChipmunkSegmentShape *
boundSeg(ChipmunkBody *body, cpVect a, cpVect b, cpFloat radius, cpFloat elasticity,cpFloat friction, cpShapeFilter filter, cpCollisionType collisionType)
{
    ChipmunkSegmentShape *seg = [ChipmunkSegmentShape segmentWithBody:body from:a to:b radius:radius];
    seg.elasticity = elasticity;
    seg.friction = friction;
    seg.filter = filter;
    seg.collisionType = collisionType;
    
    return seg;
}



#pragma mark -

@interface AlvinPhysicsBody ()

@property ChipmunkBody* body;
@property NSArray* shapes;

@end



#pragma mark -

@implementation AlvinPhysicsBody

#pragma mark -
#pragma mark Properties

-(NSArray *)chipmunkObjects
{
    if ([ChipmunkBody staticBody] == self.body) return self.shapes;
    else return [self.shapes arrayByAddingObject:self.body];
}

-(CGAffineTransform)getTransform
{
    return self.body.transform;
}

-(void)setPosition:(CGPoint)position
{
    self.body.position = position;
}

-(CGPoint)position
{
    return self.body.position;
}

-(CGFloat)angle
{
    return self.body.angle;
}

-(void)setAngle:(CGFloat)angle
{
    self.body.angle = angle;
}

#pragma mark -
#pragma mark Physics management

-(void)removeFromWorld
{
//    [self.body.space addPostStepRemoval:self]; // correct way but floods with warnings
    [self.body.space performSelectorOnMainThread:@selector(smartRemove:) withObject:self waitUntilDone:YES];
}

#pragma mark -
#pragma mark Initialization

-(void)dealloc
{
    [self removeFromWorld];
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.shapes = [NSArray array];
    }
    return self;
}

+(instancetype)bodyWithCircleOfRadius:(CGFloat)radius
{
    AlvinPhysicsBody* me = [self staticBodyWithCircleOfRadius:radius];
    
    cpFloat density = defaultDensity;
    cpFloat mass = density * radius * radius * M_PI;
    cpFloat moment = cpMomentForCircle(mass, 0, radius, cpvzero);
    me.body = [[ChipmunkBody alloc] initWithMass:mass andMoment:moment];
    
    [me.shapes makeObjectsPerformSelector:@selector(setBody:) withObject:me.body];
    
    return me;
}

+(instancetype)bodyWithRectangleOfSize:(CGSize)size
{
    return [self bodyWithRectangleOfSize:size center:CGPointZero];
}

+(instancetype)bodyWithRectangleOfSize:(CGSize)size center:(CGPoint)center
{
    AlvinPhysicsBody* me = [self staticBodyWithRectangleOfSize:size center:center];
    
    cpFloat density = defaultDensity;
    cpFloat mass = density * size.width * size.height;
    cpFloat moment = cpMomentForBox(mass, size.width, size.height);
    me.body = [[ChipmunkBody alloc] initWithMass:mass andMoment:moment];
    
    [me.shapes makeObjectsPerformSelector:@selector(setBody:) withObject:me.body];
    
    return me;
}



+(instancetype)staticBodyWithCircleOfRadius:(CGFloat)radius
{
    AlvinPhysicsBody* me = [[self alloc] init];
    
    me.body = [ChipmunkBody staticBody];
    
    ChipmunkShape* shape = [[ChipmunkCircleShape alloc] initWithBody:me.body radius:radius offset:cpvzero];
    shape.elasticity = defaultElasticity;
    shape.friction = defaultFriction;
    
    me.shapes = @[shape];
    
    return me;
}

+(instancetype)staticBodyWithRectangleOfSize:(CGSize)size
{
    return [self staticBodyWithRectangleOfSize:size center:CGPointZero];
}

+(instancetype)staticBodyWithRectangleOfSize:(CGSize)size center:(CGPoint)center
{
    AlvinPhysicsBody* me = [[self alloc] init];
    
    me.body = [ChipmunkBody staticBody];
    
    CGFloat halfWidth = size.width / 2;
    CGFloat halfHeight = size.height / 2;
    
    cpBB bb = cpBBNew(center.x - halfWidth, center.y + halfHeight, center.x + halfWidth, center.y - halfHeight);
    ChipmunkShape* shape = [[ChipmunkPolyShape alloc] initBoxWithBody:me.body bb:bb radius:0];
    shape.elasticity = defaultElasticity;
    shape.friction = defaultFriction;
    
    me.shapes = @[shape];
    
    return me;
}



+(instancetype)bodyWithEdgeLoopFromRect:(CGRect)rect
{
    AlvinPhysicsBody* me = [[self alloc] init];
    
    me.body = [ChipmunkBody staticBody];
    
    cpFloat l = rect.origin.x - defaultThickness;
    cpFloat b = rect.origin.y + rect.size.height + defaultThickness;
    cpFloat r = rect.origin.x + rect.size.width + defaultThickness;
    cpFloat t = rect.origin.y - defaultThickness;
    
    ChipmunkShape* left = boundSeg(me.body, cpv(l,b), cpv(l,t), defaultThickness, defaultElasticity, defaultFriction, CP_SHAPE_FILTER_ALL, nil);
    ChipmunkShape* top = boundSeg(me.body, cpv(l,t), cpv(r,t), defaultThickness, defaultElasticity, defaultFriction, CP_SHAPE_FILTER_ALL, nil);
    ChipmunkShape* right = boundSeg(me.body, cpv(r,t), cpv(r,b), defaultThickness, defaultElasticity, defaultFriction, CP_SHAPE_FILTER_ALL, nil);
    ChipmunkShape* bottom = boundSeg(me.body, cpv(r,b), cpv(l,b), defaultThickness, defaultElasticity, defaultFriction, CP_SHAPE_FILTER_ALL, nil);
    
    me.shapes = @[left, right, top, bottom];
    
    return me;
}

@end
