//
//  ViewController.m
//  AlvinPhysicsDemo
//
//  Created by Admin on 12/10/14.
//  Copyright (c) 2014 IC. All rights reserved.
//

#import "ViewController.h"

#import "AlvinView.h"
#import "AlvinScene.h"
#import "AlvinShapeArt.h"
#import "AlvinPhysicsBody.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)loadView
{
    AlvinView* view = [[AlvinView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    view.backgroundColor = [UIColor whiteColor];
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Create the scene.
    AlvinScene* scene = [[AlvinScene alloc] initWithFrame:self.view.frame];
    scene.physicsBody = [AlvinPhysicsBody bodyWithEdgeLoopFromRect:scene.bounds];
    
    
    
    // Some arbitrary parameters.
    CGFloat circleRadius = 32;
    CGFloat circleDiameter = 2 * circleRadius;
    CGFloat lineWidht = 2.2;
    
    
    
    // Create the shape that you want and ignore the origin.
    // The origin coordinates from the frame are ignored
    // in order to align the view and the physics object.
    AlvinShapeArt* circle = [[AlvinShapeArt alloc] initWithFrame:CGRectMake(0, 0, circleDiameter, circleDiameter)];
    
    // Create the physics body of your choice.
    circle.physicsBody = [AlvinPhysicsBody bodyWithCircleOfRadius:circleRadius];
    
    // The accessor methods of "center" are overriden to modify the physics body transformation directly.
    circle.center = CGPointMake(64, 128);
    
    // Create a path object.
    CGMutablePathRef pathCircle = CGPathCreateMutable();
    /*
     Create the path components.
     
     Hint: When you create the path for the AlvinShapeArt have in mind
     that the center of your shape is the center of the UIView frame.
     That is why we create the circle shape with center (r, r).
     
     Hint: UIKit strokes have of the path widht inwards and half of the
     path widht outwards. This means that if you stroke a square with
     side "a" into a view with size (widht = a, height = a) with line
     widht of 2 then the stroke width that you see will be lineWidth/2 = 1.
     The default behavior is to clip the rest. That's why the path radius
     is actually the "circleRadius - lineWidth".
     */
    CGPathAddArc(pathCircle, NULL, circleRadius, circleRadius, circleRadius - lineWidht, 0, 2*M_PI, false);
    circle.path = pathCircle;
    CGPathRelease(pathCircle);
    
    // Modify the shape parameters.
    circle.lineWidth = lineWidht;
    circle.fillColor = [UIColor grayColor];
    circle.strokeColor = [UIColor blackColor];
    
    // You can easily use standard UIKit elements in your scene.
    UILabel* label = [[UILabel alloc] initWithFrame:circle.bounds];
    label.text = @"7";
    label.font = [UIFont systemFontOfSize:32];
    label.textAlignment = NSTextAlignmentCenter;
    [circle addSubview:label];
    
    // Add your AlvinArt to the scene just as any other UIView.
    [scene addSubview:circle];
    
    
    
    AlvinShapeArt* square = [[AlvinShapeArt alloc] initWithFrame:CGRectMake(0, 0, circleDiameter, circleDiameter)];
    square.physicsBody = [AlvinPhysicsBody bodyWithRectangleOfSize:CGSizeMake(circleDiameter, circleDiameter)];
    square.center = CGPointMake(32, 32);
    
    CGMutablePathRef squarePath = CGPathCreateMutable();
    CGFloat squareSide = circleDiameter - lineWidht*2;
    CGPathAddRect(squarePath, NULL, CGRectMake(lineWidht, lineWidht, squareSide, squareSide));
    square.path = squarePath;
    CGPathRelease(squarePath);
    
    square.lineWidth = lineWidht;
    square.fillColor = [UIColor greenColor];
    square.strokeColor = [UIColor blackColor];
    
    [scene addSubview:square];
    
    
    
    // You can use AlvinView in order the have the -presentScene: method
    // or you can simply manage the scene as an UIView yourself.
    // Using AlvinView is optional.
    [(AlvinView*)self.view presentScene:scene];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
