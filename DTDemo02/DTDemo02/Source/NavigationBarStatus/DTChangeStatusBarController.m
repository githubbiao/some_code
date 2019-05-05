//
//  DTChangeStatusBarController.m
//  demo
//
//  Created by WangDa Mac on 2019/4/22.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTChangeStatusBarController.h"

@interface DTChangeStatusBarController ()

@end

@implementation DTChangeStatusBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = UIColor.redColor;

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
//    info.plist 文件中将 View controller-based status bar appearance 设置为 NO
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
#pragma clang diagnostic pop
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setNeedsStatusBarAppearanceUpdate];
}

@end
