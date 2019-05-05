//
//  DTAnimationController.m
//  DTDemo02
//
//  Created by WangDa Mac on 2019/4/28.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTAnimationController.h"
#import "DTScaleAnimationView.h"
#import "DTAnimationContainer.h"
@interface DTAnimationController ()
@property (nonatomic, strong, readwrite) DTScaleAnimationView *animationView;
@end

@implementation DTAnimationController

- (DTScaleAnimationView *)animationView {
    if (!_animationView) {
        _animationView = [[DTScaleAnimationView alloc] init];
    }
    return _animationView;
}
- (void)loadView {
    self.view = [[DTAnimationContainer alloc] initWithFrame:UIScreen.mainScreen.bounds];
    NSLog(@"view frame: %@", NSStringFromCGRect(self.view.frame));
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.animationView.center = self.view.center;
    NSLog(@"view frame: %@", NSStringFromCGRect(self.view.frame));
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"view frame: %@", NSStringFromCGRect(self.view.frame));
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.animationView showInView:self.view];
}

- (void)dealloc {
    
}

@end
