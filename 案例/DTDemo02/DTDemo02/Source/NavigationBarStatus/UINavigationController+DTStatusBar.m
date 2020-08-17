//
//  UINavigationController+DTStatusBar.m
//  DTDemo02
//
//  Created by WangDa Mac on 2019/4/29.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "UINavigationController+DTStatusBar.h"

@implementation UINavigationController (DTStatusBar)
- (UIViewController *)childViewControllerForStatusBarHidden {
    return self.topViewController;
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}
@end
