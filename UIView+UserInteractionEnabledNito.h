//
//  UIView+UserInteractionEnabledNito.h
//  DTTest
//
//  Created by WangDa Mac on 2019/5/31.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (UserInteractionEnabledNito)

/// registe `view` with `name`, return the `view`
+ (__kindof UIView *)registerView:(__kindof UIView *)view name:(NSString *)name;

/// unregiste `view` with `name`, return the unregisted `view` or nil
/// you should call this method in `dealloc`, if not it would make memory leak
+ (__kindof UIView *)unregisterViewForName:(NSString *)name;

/// set the registed view's user interface enable with param
/// you also can get the registerd view by the registed name
+ (__kindof UIView *)setViewWithName:(NSString *)name userInteractionEnabled:(BOOL)userInteractionEnabled;
@end

NS_ASSUME_NONNULL_END
