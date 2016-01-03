//
//  ViewController.m
//  连带动画UISanpBehavior
//
//  Created by admin on 15/12/23.
//  Copyright © 2015年 AlezJi. All rights reserved.
//

//http://www.jianshu.com/p/e6ddeaca4b48


#import "ViewController.h"

@interface ViewController ()
@property(strong,nonatomic)UIView *squareView;
@property(strong,nonatomic)UIDynamicAnimator *animator;
@property(strong,nonatomic)UISnapBehavior *snapBehavior;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createSmallSquareView];
    [self createAnimatorAndBehaviors];
    [self createGestureRecognizer];
}
//1.初始化基本控件
- (void) createSmallSquareView{
    self.squareView = [[UIView alloc] initWithFrame: CGRectMake(100, 100, 80, 80)];
    self.squareView.backgroundColor = [UIColor greenColor];
    self.squareView.center = self.view.center;
    [self.view addSubview:self.squareView];
}
- (void) createAnimatorAndBehaviors{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.snapBehavior = [[UISnapBehavior alloc] initWithItem:self.squareView snapToPoint:self.squareView.center];
    self.snapBehavior.damping = 0.5f; /* Medium oscillation */
    [self.animator addBehavior:self.snapBehavior];
}
//2.添加手势给控制器view
- (void) createGestureRecognizer{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(snapTap:)];
    [self.view addGestureRecognizer:tap];
}
//3.执行手势监听方法
- (void)snapTap:(UITapGestureRecognizer *)paramTap{
    CGPoint tapPoint = [paramTap locationInView:self.view];
    if (self.snapBehavior != nil){
        [self.animator removeBehavior:self.snapBehavior];
    }
    self.snapBehavior = [[UISnapBehavior alloc] initWithItem:self.squareView snapToPoint:tapPoint];
    self.snapBehavior.damping = 0.5f;  //剧列程度
    [self.animator addBehavior:self.snapBehavior];
}

@end
