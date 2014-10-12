//
//  ViewController.m
//  MDWAutoLayout-Example
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 11.10.14.
//  Copyright (c) 2014 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import "ViewController.h"
#import "UIView+MDWAutoLayout.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView
{
    [super loadView];
    
    [self layoutViews];
}

- (void)layoutViews
{
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.scrollView = [UIScrollView initWithAutoLayoutEnabled];
    [self.view addSubview:self.scrollView];
    
    [self.scrollView alignEdges:MDWAutoLayoutEdgeTop|MDWAutoLayoutEdgeTrailing|MDWAutoLayoutEdgeBottom|MDWAutoLayoutEdgeLeading withView:self.view];

    self.scrollViewContent = [UIView initWithAutoLayoutEnabled];
    [self.scrollView addSubview:self.scrollViewContent];
    
    // we need to get a width for the contentView that is independant of the scrollview!
    [self.scrollViewContent setWidthEqualToView:self.scrollView offset:0];
    
    
    // attach contentView edges to "all" edges of the scrollView
    
    // attach them separately
//    [self.scrollViewContent alignEdge:MDWAutoLayoutEdgeTop withView:self.scrollView];
//    [self.scrollViewContent alignEdge:MDWAutoLayoutEdgeTrailing withView:self.scrollView];
//    [self.scrollViewContent alignEdge:MDWAutoLayoutEdgeBottom withView:self.scrollView];
//    [self.scrollViewContent alignEdge:MDWAutoLayoutEdgeLeading withView:self.scrollView];
    
    // or all at once
    [self.scrollViewContent alignEdges:MDWAutoLayoutEdgeTop|MDWAutoLayoutEdgeTrailing|MDWAutoLayoutEdgeBottom|MDWAutoLayoutEdgeLeading withView:self.scrollView];
    
    UILabel *label = [UILabel initWithAutoLayoutEnabled];
    label.numberOfLines = 0;
    label.text = @"Lorem ipsum Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.";
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor purpleColor];
    [self.scrollViewContent addSubview:label];
    [label alignEdge:MDWAutoLayoutEdgeTop withView:self.scrollViewContent offset:30];
    [label alignEdge:MDWAutoLayoutEdgeLeading withView:self.scrollViewContent offset:10];
    [label alignEdge:MDWAutoLayoutEdgeTrailing withView:self.scrollViewContent offset:-10];
    
    
    // Fullwidth & fixed height
    UIView *view1 = [UIView initWithAutoLayoutEnabled];
    view1.backgroundColor = [UIColor purpleColor];
    [self.scrollViewContent addSubview:view1];
    [view1 alignUnderView:label withOffset:20];
    [view1 alignEdge:MDWAutoLayoutEdgeLeading withView:self.scrollViewContent offset:10];
    [view1 alignEdge:MDWAutoLayoutEdgeTrailing withView:self.scrollViewContent offset:-10];
    [view1 setFixedHeight:100];

    UIView *view2 = [UIView initWithAutoLayoutEnabled];
    view2.backgroundColor = [UIColor purpleColor];
    [self.scrollViewContent addSubview:view2];
    [view2 alignUnderView:view1 withOffset:20];
    [view2 alignEdge:MDWAutoLayoutEdgeLeading withView:self.scrollViewContent offset:10];
    [view2 alignEdge:MDWAutoLayoutEdgeTrailing withView:self.scrollViewContent offset:-10];
    [view2 setFixedHeight:100];
    
    // left aligned, fixed width
    UIView *view3 = [UIView initWithAutoLayoutEnabled];
    view3.backgroundColor = [UIColor greenColor];
    [self.scrollViewContent addSubview:view3];
    [view3 alignUnderView:view2 withOffset:10];
    [view3 setFixedWidth:self.view.frame.size.width / 2 - 15];
    [view3 alignEdge:MDWAutoLayoutEdgeLeading withView:self.scrollViewContent offset:10];
    [view3 setFixedHeight:100];
    
    // right aligned, fixed width
    UIView *view4 = [UIView initWithAutoLayoutEnabled];
    view4.backgroundColor = [UIColor blueColor];
    [self.scrollViewContent addSubview:view4];
    [view4 alignUnderView:view2 withOffset:10];
    [view4 alignEdge:MDWAutoLayoutEdgeTrailing withView:self.scrollViewContent offset:-10];
    [view4 setFixedWidth:self.view.frame.size.width / 2 - 15];
    [view4 setFixedHeight:100];
    
    // left aligned, fixed size
    UIView *view5 = [UIView initWithAutoLayoutEnabled];
    view5.backgroundColor = [UIColor greenColor];
    [self.scrollViewContent addSubview:view5];
    [view5 alignUnderView:view4 withOffset:10];
    [view5 alignEdge:MDWAutoLayoutEdgeLeading withView:self.scrollViewContent offset:10];
    [view5 setFixedWidth:self.view.frame.size.width / 2 - 15];
    [view5 setFixedHeight:100];
    
    // left aligned to view5, fixed size
    UIView *view6 = [UIView initWithAutoLayoutEnabled];
    view6.backgroundColor = [UIColor blueColor];
    [self.scrollViewContent addSubview:view6];
    [view6 alignUnderView:view4 withOffset:10];
    [view6 alignRightFromView:view5 offset:10];
    [view6 setFixedWidth:self.view.frame.size.width / 2 - 15];
    [view6 setFixedHeight:500];
    
    // left aligned, 50% width
    UILabel *leftColumnLabel = [UILabel initWithAutoLayoutEnabled];
    [self.scrollViewContent addSubview:leftColumnLabel];
    leftColumnLabel.backgroundColor = [UIColor greenColor];
    leftColumnLabel.numberOfLines = 0;
    leftColumnLabel.text = @"Lorem ipsum Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.";
    [leftColumnLabel alignUnderView:view6 withOffset:10];
    [leftColumnLabel alignEdge:MDWAutoLayoutEdgeLeading withView:self.scrollViewContent offset:10];
    [leftColumnLabel setWidthEqualToView:self.scrollViewContent offset:-15 multiplier:0.5];

    // rigt aligned, 50% width
    UILabel *rightColumnLabel = [UILabel initWithAutoLayoutEnabled];
    [self.scrollViewContent addSubview:rightColumnLabel];
    rightColumnLabel.backgroundColor = [UIColor blueColor];
    rightColumnLabel.numberOfLines = 0;
    rightColumnLabel.text = @"Lorem ipsum Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.";
    [rightColumnLabel alignUnderView:view6 withOffset:10];
    [rightColumnLabel alignEdge:MDWAutoLayoutEdgeTrailing withView:self.scrollViewContent offset:-10];
    [rightColumnLabel setWidthEqualToView:self.scrollViewContent offset:-15 multiplier:0.5];
    
    
    // this will define the content size so add bottom padding here
    [self.scrollViewContent alignEdge:MDWAutoLayoutEdgeBottom withView:leftColumnLabel offset:10];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
