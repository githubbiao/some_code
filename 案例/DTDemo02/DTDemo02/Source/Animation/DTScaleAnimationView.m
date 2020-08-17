//
//  DTScaleAnimationView.m
//  DTDemo02
//
//  Created by WangDa Mac on 2019/4/28.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTScaleAnimationView.h"

@interface DTScaleAnimationView ()

@property (nonatomic, strong) UIView *subView;
@property (nonatomic, strong) UIView *subsubView;
@property (nonatomic, strong) UIView *subsubsubView;

@end

@implementation DTScaleAnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect subFrame = self.bounds;
        subFrame.size.width -= 20;
        subFrame.size.height -= 20;
        self.backgroundColor = [UIColor redColor];
        _subView = [UIView new];
        _subView.backgroundColor = [UIColor yellowColor];
        _subView.frame = subFrame;
        [self addSubview:_subView];
        
        subFrame.size.width -= 20;
        subFrame.size.height -= 20;
        subFrame.origin.x += 20;
        subFrame.origin.y += 20;
        _subsubView = [UIView new];
        _subsubView.frame = subFrame;
        _subsubView.backgroundColor = [UIColor greenColor];
        [_subView addSubview:_subsubView];
        
        
        subFrame.size.width -= 40;
        subFrame.size.height -= 50;
        subFrame.origin.x += 0;
        subFrame.origin.y += 0;
        _subsubsubView = [UIView new];
        _subsubsubView.backgroundColor = [UIColor blueColor];
        [_subsubView addSubview:_subsubsubView];
    }
    return self;
}

- (instancetype)init
{
    return [self initWithFrame:CGRectMake(0, 0, 200, 200)];
}

- (void)showInView:(UIView *)view {
    [self transfor3DWithSuperView:view];
}

- (void)transfor3DWithSuperView:(UIView *)superView {
    CATransform3D transform3D = self.layer.transform;
    [superView addSubview:self];
    self.layer.transform = CATransform3DScale(transform3D, 0, 0, 0);
    [UIView animateWithDuration:2.f animations:^{
        self.layer.transform = CATransform3DScale(transform3D, 1, 1, 0.5);
    }];
}

- (void)transfor2DWithSuperView:(UIView *)superView {
    // CATransform3DMakeScale (CGFloat sx, CGFloat sy, CGFloat sz)
    
    CGAffineTransform transform = self.transform;
    [superView addSubview:self];
    self.transform = CGAffineTransformScale(transform, 0, 0);
    [UIView animateWithDuration:2.f animations:^{
        self.transform = CGAffineTransformScale(transform, 1, 1);
    }];
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    NSLog(@"----");
}


@end
