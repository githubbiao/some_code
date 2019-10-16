//
//  DTChangeStatusBarController.h
//  demo
//
//  Created by WangDa Mac on 2019/4/22.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN




/**
 需要重写
 
 - (UIViewController *)childViewControllerForStatusBarHidden {
    return self.topViewController;
 }
 
 - (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
 }
 */
@interface DTChangeStatusBarController : UIViewController
@end

NS_ASSUME_NONNULL_END
