//
//  UIView+MDWAutoLayout.m
//  MDWAutoLayout-Example
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 11.10.14.
//  Copyright (c) 2014 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import "UIView+MDWAutoLayout.h"

@implementation UIView (MDWAutoLayout)

#pragma mark - Edges

- (NSArray*)alignEdges:(MDWAutoLayoutEdge)edges withView:(UIView*)view
{
    return [self alignEdges:edges withView:view offset:0];
}

- (NSArray*)alignEdges:(MDWAutoLayoutEdge)edges withView:(UIView*)view offset:(CGFloat)offset
{
    UIView *superview = [UIView commonSuperviewWithView:self otherView:view];
    
    return [self alignEdges:edges withView:view offset:offset superview:superview];
}

- (NSArray*)alignEdges:(MDWAutoLayoutEdge)edges withView:(UIView*)view offset:(CGFloat)offset superview:(UIView*)superview
{
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    
    if (edges & MDWAutoLayoutEdgeTop) {[constraints addObject:[self alignEdge:MDWAutoLayoutEdgeTop withView:view offset:offset superview:superview]];}
    if (edges & MDWAutoLayoutEdgeRight) [constraints addObject:[self alignEdge:MDWAutoLayoutEdgeRight withView:view offset:offset superview:superview]];
    if (edges & MDWAutoLayoutEdgeBottom) [constraints addObject:[self alignEdge:MDWAutoLayoutEdgeBottom withView:view offset:offset superview:superview]];
    if (edges & MDWAutoLayoutEdgeLeft) [constraints addObject:[self alignEdge:MDWAutoLayoutEdgeLeft withView:view offset:offset superview:superview]];
    if (edges & MDWAutoLayoutEdgeLeading) [constraints addObject:[self alignEdge:MDWAutoLayoutEdgeLeading withView:view offset:offset superview:superview]];
    if (edges & MDWAutoLayoutEdgeTrailing) [constraints addObject:[self alignEdge:MDWAutoLayoutEdgeTrailing withView:view offset:offset superview:superview]];
    
    return constraints;
}

- (NSLayoutConstraint*)alignEdge:(MDWAutoLayoutEdge)edge withView:(UIView*)view
{
    return [self alignEdge:edge withView:view offset:0];
}

- (NSLayoutConstraint*)alignEdge:(MDWAutoLayoutEdge)edge withView:(UIView*)view offset:(CGFloat)offset
{
    UIView *superview = [UIView commonSuperviewWithView:self otherView:view];
    
    return [self alignEdge:edge withView:view offset:offset superview:superview];
}

- (NSLayoutConstraint*)alignEdge:(MDWAutoLayoutEdge)edge withView:(UIView*)view offset:(CGFloat)offset superview:(UIView*)superview
{
    NSLayoutAttribute attribute;
    
    switch (edge)
    {
        case MDWAutoLayoutEdgeTop: { attribute = NSLayoutAttributeTop; break; }
        case MDWAutoLayoutEdgeRight: { attribute = NSLayoutAttributeRight; break; }
        case MDWAutoLayoutEdgeBottom: { attribute = NSLayoutAttributeBottom; break; }
        case MDWAutoLayoutEdgeLeft: { attribute = NSLayoutAttributeLeft; break; }
        case MDWAutoLayoutEdgeLeading: { attribute = NSLayoutAttributeLeading; break; }
        case MDWAutoLayoutEdgeTrailing: { attribute = NSLayoutAttributeTrailing; break; }
        default: break;
    }
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:NSLayoutRelationEqual toItem:view attribute:attribute multiplier:1.0 constant:offset];
    [superview addConstraint:constraint];
    
    return constraint;
}



//+ (NSArray*)alignEdges:(MDWAutoLayoutEdge)edges ofViews:(NSArray*)views withView:(UIView*)view
//{}
//+ (NSArray*)alignEdges:(MDWAutoLayoutEdge)edges ofViews:(NSArray*)views withView:(UIView*)view offset:(CGFloat)offset
//{}
//+ (NSArray*)alignEdges:(MDWAutoLayoutEdge)edges ofViews:(NSArray*)views withView:(UIView*)view offset:(CGFloat)offset superview:(UIView*)superview
//{}


#pragma mark - Vertical Positioning

- (NSLayoutConstraint*)alignUnderView:(UIView*)view withOffset:(CGFloat)offset
{
    return [self alignUnderView:view withOffset:offset inSuperview:self.superview];
}

- (NSLayoutConstraint*)alignUnderView:(UIView*)view withOffset:(CGFloat)offset inSuperview:(UIView*)superview
{
    NSLayoutConstraint *layoutConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:offset];
    [superview addConstraint:layoutConstraint];
    
    return layoutConstraint;
}

#pragma mark - Horizontal Positioning

- (NSLayoutConstraint*)alignLeftFromView:(UIView*)view offset:(CGFloat)offset
{
    return [self alignLeftFromView:view offset:offset superview:self.superview];
}

- (NSLayoutConstraint*)alignLeftFromView:(UIView*)view offset:(CGFloat)offset superview:(UIView*)superview
{
    NSLayoutConstraint *layoutConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:offset];
    [superview addConstraint:layoutConstraint];
    
    return layoutConstraint;
}

- (NSLayoutConstraint*)alignRightFromView:(UIView*)view offset:(CGFloat)offset
{
    return [self alignRightFromView:view offset:offset superview:self.superview];
}

- (NSLayoutConstraint*)alignRightFromView:(UIView*)view offset:(CGFloat)offset superview:(UIView*)superview
{
    NSLayoutConstraint *layoutConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeRight multiplier:1.0 constant:offset];
    [superview addConstraint:layoutConstraint];
    
    return layoutConstraint;
}

#pragma mark - Centering

- (NSLayoutConstraint*)alignHorizontallyWithView:(UIView*)view
{
    return [self alignHorizontallyWithView:view withOffset:0];
}

- (NSLayoutConstraint*)alignHorizontallyWithView:(UIView*)view withOffset:(CGFloat)offset
{
    UIView *superview = [UIView commonSuperviewWithView:self otherView:view];
    
    return [self alignHorizontallyWithView:view withOffset:offset inSuperview:superview];
}

- (NSLayoutConstraint*)alignHorizontallyWithView:(UIView*)view withOffset:(CGFloat)offset inSuperview:(UIView*)superview
{
    NSLayoutConstraint *layoutConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:offset];
    [superview addConstraint:layoutConstraint];
    
    return layoutConstraint;
}

#pragma mark - Size

- (NSLayoutConstraint*)setFixedHeight:(CGFloat)height
{
    NSLayoutConstraint *layoutConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [self addConstraint:layoutConstraint];
    
    return layoutConstraint;
}

- (NSLayoutConstraint*)setFixedWidth:(CGFloat)width
{
    NSLayoutConstraint *layoutConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self addConstraint:layoutConstraint];
    
    return layoutConstraint;
}

- (NSLayoutConstraint*)setWidthEqualToView:(UIView*)view offset:(CGFloat)offset
{
    return [self setWidthEqualToView:view offset:offset multiplier:1.0];
}

- (NSLayoutConstraint*)setWidthEqualToView:(UIView*)view offset:(CGFloat)offset multiplier:(CGFloat)multiplier
{
    UIView *superview = [UIView commonSuperviewWithView:self otherView:view];
    
    return [self setWidthEqualToView:view offset:offset multiplier:multiplier superview:superview];
}

- (NSLayoutConstraint*)setWidthEqualToView:(UIView*)view offset:(CGFloat)offset multiplier:(CGFloat)multiplier superview:(UIView *)superview
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeWidth multiplier:multiplier constant:offset];
    [superview addConstraint:constraint];
    
    return constraint;
}

- (NSLayoutConstraint*)setHeightEqualToView:(UIView*)view withOffset:(CGFloat)offset
{
    return [self setHeightEqualToView:view withOffset:offset inSuperview:self.superview];
}

- (NSLayoutConstraint*)setHeightEqualToView:(UIView*)view withOffset:(CGFloat)offset inSuperview:(UIView*)superview
{
    NSLayoutConstraint *layoutConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:offset];
    [superview addConstraint:layoutConstraint];
    
    return layoutConstraint;
}

#pragma mark - Helpers

+ (instancetype)initWithAutoLayoutEnabled
{
    UIView *view = [[self alloc] init];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    return view;
}

+ (UIView*)commonSuperviewWithView:(UIView *)view otherView:(UIView *)otherView
{
    if (view == otherView) return view.superview;
    
    if (view.window != otherView.window) return nil;
    
    NSMutableArray *mergedViewHierarchy = [[NSMutableArray alloc] initWithObjects:view, otherView, nil];

    UIView *commonSuperview = nil;
    
    NSInteger checkIndex = 0;
    UIView *checkingView = nil;
    while (checkIndex < mergedViewHierarchy.count && !commonSuperview)
    {
        checkingView = mergedViewHierarchy[checkIndex++];
        
        UIView *superview = checkingView.superview;
        if ([mergedViewHierarchy containsObject:superview])
        {
            commonSuperview = superview;
        }
        else if (superview)
        {
            [mergedViewHierarchy addObject:superview];
        }
    }
    
    return commonSuperview;
}


@end
