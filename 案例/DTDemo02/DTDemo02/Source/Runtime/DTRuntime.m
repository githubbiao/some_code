//
//  DTRuntime.m
//  DTDemo02
//
//  Created by WangDa Mac on 2019/4/26.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTRuntime.h"
#import <objc/runtime.h>
void exchangeInstancesMethod(Class cls, SEL sel, Class aClass, SEL aSel) {
    Method swizzeMethod = class_getInstanceMethod(aClass, aSel);
    Method originalMethod = class_getInstanceMethod(cls, sel);
    BOOL isAddid = class_addMethod(cls, aSel, method_getImplementation(swizzeMethod), method_getTypeEncoding(swizzeMethod));
    if (isAddid) {
        class_addMethod(aClass, sel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzeMethod);
    }
}

void exchangeInstanceMethod(Class cls, SEL sel, SEL aSel) {
    exchangeInstancesMethod(cls, sel, cls, aSel);
}
