//
//  UIView+UserInteractionEnabledNito.m
//  DTTest
//
//  Created by WangDa Mac on 2019/5/31.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "UIView+UserInteractionEnabledNito.h"


static NSMutableDictionary *DTUIViewUserInteractionCategoryDictionary = nil;

void initDTUIViewUserInteractionCategoryDictionary(void) {
    if (!DTUIViewUserInteractionCategoryDictionary) {
        DTUIViewUserInteractionCategoryDictionary = @{}.mutableCopy;
    }
}

@implementation UIView (UserInteractionEnabledNito)

+ (UIView *)registerView:(__kindof UIView *)view name:(NSString *)name {
    if (!view || !name || ![view isKindOfClass:[UIView class]]) {
        return nil;
    }
    initDTUIViewUserInteractionCategoryDictionary();
    [DTUIViewUserInteractionCategoryDictionary setValue:view forKey:name];

    return view;
}
+ (UIView *)unregisterViewForName:(NSString *)name {
    if (!name) {
        return nil;
    }
    initDTUIViewUserInteractionCategoryDictionary();
    __kindof UIView *view = [DTUIViewUserInteractionCategoryDictionary objectForKey:name];
    [DTUIViewUserInteractionCategoryDictionary removeObjectForKey:name];
    return view;
    
}

+ (UIView *)setViewWithName:(NSString *)name userInteractionEnabled:(BOOL)userInteractionEnabled {
    if (!name) {
        return nil;
    }
    initDTUIViewUserInteractionCategoryDictionary();
    __kindof UIView *view = [DTUIViewUserInteractionCategoryDictionary objectForKey:name];
    view.userInteractionEnabled = userInteractionEnabled;
    return view;
}


@end
