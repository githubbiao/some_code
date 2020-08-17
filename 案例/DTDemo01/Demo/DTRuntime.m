//
//  DTRuntime.m
//  Demo
//
//  Created by WangDa Mac on 2019/5/8.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTRuntime.h"
#import <objc/runtime.h>

objc_AssociationPolicy dt_convertToOBJCAssociationPolicy(DTOBJCAssociatedType from) {
    switch (from) {
        case DTOBJCAssociatedTypeAssign:
            return OBJC_ASSOCIATION_ASSIGN;
        case DTOBJCAssociatedTypeRetainNonatomic:
            return OBJC_ASSOCIATION_RETAIN_NONATOMIC;
        case DTOBJCAssociatedTypeCopyNonatomic:
            return OBJC_ASSOCIATION_COPY_NONATOMIC;
        case DTOBJCAssociatedTypeRetain:
            return OBJC_ASSOCIATION_RETAIN;
        case DTOBJCAssociatedTypeCopy:
            return OBJC_ASSOCIATION_COPY;
    }
}

id dt_runtimeGetAssociated(id objct, const void * key) {
    id objc =objc_getAssociatedObject(objct, key);
    return objc;
}

void dt_runtimeSetAssociated(id objct, const void * key, id value, DTOBJCAssociatedType associateType) {
    objc_AssociationPolicy objcAssociateType = dt_convertToOBJCAssociationPolicy(associateType);
    objc_setAssociatedObject(objct, key, value, objcAssociateType);
}

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
