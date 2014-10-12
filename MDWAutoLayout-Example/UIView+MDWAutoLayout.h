//
//  UIView+MDWAutoLayout.h
//  MDWAutoLayout-Example
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 11.10.14.
//  Copyright (c) 2014 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MDWAutoLayoutEdge)
{
    MDWAutoLayoutEdgeTop        = 1 << 0,
    MDWAutoLayoutEdgeRight      = 1 << 1,
    MDWAutoLayoutEdgeBottom     = 1 << 2,
    MDWAutoLayoutEdgeLeft       = 1 << 3,
    MDWAutoLayoutEdgeLeading    = 1 << 4,
    MDWAutoLayoutEdgeTrailing   = 1 << 5
};

@interface UIView (MDWAutoLayout)




#pragma mark - Edges
- (NSArray*)alignEdges:(MDWAutoLayoutEdge)edges withView:(UIView*)view;
- (NSArray*)alignEdges:(MDWAutoLayoutEdge)edges withView:(UIView*)view offset:(CGFloat)offset;
- (NSArray*)alignEdges:(MDWAutoLayoutEdge)edges withView:(UIView*)view offset:(CGFloat)offset superview:(UIView*)superview;

- (NSLayoutConstraint*)alignEdge:(MDWAutoLayoutEdge)edge withView:(UIView*)view;
- (NSLayoutConstraint*)alignEdge:(MDWAutoLayoutEdge)edge withView:(UIView*)view offset:(CGFloat)offset;
- (NSLayoutConstraint*)alignEdge:(MDWAutoLayoutEdge)edge withView:(UIView*)view offset:(CGFloat)offset superview:(UIView*)superview;

//+ (NSArray*)alignEdges:(MDWAutoLayoutEdge)edges ofViews:(NSArray*)views withView:(UIView*)view;
//+ (NSArray*)alignEdges:(MDWAutoLayoutEdge)edges ofViews:(NSArray*)views withView:(UIView*)view offset:(CGFloat)offset;
//+ (NSArray*)alignEdges:(MDWAutoLayoutEdge)edges ofViews:(NSArray*)views withView:(UIView*)view offset:(CGFloat)offset superview:(UIView*)superview;


#pragma mark -  Vertical Positioning
- (NSLayoutConstraint*)alignUnderView:(UIView*)view withOffset:(CGFloat)offset;
- (NSLayoutConstraint*)alignUnderView:(UIView*)view withOffset:(CGFloat)offset inSuperview:(UIView*)superview;

#pragma mark - Horizontal Positioning
- (NSLayoutConstraint*)alignLeftFromView:(UIView*)view offset:(CGFloat)offset;
- (NSLayoutConstraint*)alignLeftFromView:(UIView*)view offset:(CGFloat)offset superview:(UIView*)superview;

- (NSLayoutConstraint*)alignRightFromView:(UIView*)view offset:(CGFloat)offset;
- (NSLayoutConstraint*)alignRightFromView:(UIView*)view offset:(CGFloat)offset superview:(UIView*)superview;

#pragma mark - Centering
- (NSLayoutConstraint*)alignHorizontallyWithView:(UIView*)view;
- (NSLayoutConstraint*)alignHorizontallyWithView:(UIView*)view withOffset:(CGFloat)offset;
- (NSLayoutConstraint*)alignHorizontallyWithView:(UIView*)view withOffset:(CGFloat)offset inSuperview:(UIView*)superview;

#pragma mark - Size
- (NSLayoutConstraint*)setFixedHeight:(CGFloat)height;
- (NSLayoutConstraint*)setFixedWidth:(CGFloat)width;

- (NSLayoutConstraint*)setWidthEqualToView:(UIView*)view offset:(CGFloat)offset;
- (NSLayoutConstraint*)setWidthEqualToView:(UIView*)view offset:(CGFloat)offset multiplier:(CGFloat)multiplier;
- (NSLayoutConstraint*)setWidthEqualToView:(UIView*)view offset:(CGFloat)offset multiplier:(CGFloat)multiplier superview:(UIView*)superview;

- (NSLayoutConstraint*)setHeightEqualToView:(UIView*)view withOffset:(CGFloat)offset;
- (NSLayoutConstraint*)setHeightEqualToView:(UIView*)view withOffset:(CGFloat)offset inSuperview:(UIView*)superview;


#pragma mark - Helpers
+ (instancetype)initWithAutoLayoutEnabled;
+ (UIView*)commonSuperviewWithView:(UIView *)view otherView:(UIView *)otherView;
@end
