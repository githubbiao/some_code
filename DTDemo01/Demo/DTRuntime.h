//
//  DTOBJC.h
//  Demo
//
//  Created by WangDa Mac on 2019/5/8.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import <Foundation/Foundation.h>
//OBJC_ASSOCIATION_ASSIGN = 0,           /**< Specifies a weak reference to the associated object. */
//OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1, /**< Specifies a strong reference to the associated object.
//                                        *   The association is not made atomically. */
//OBJC_ASSOCIATION_COPY_NONATOMIC = 3,   /**< Specifies that the associated object is copied.
//                                        *   The association is not made atomically. */
//OBJC_ASSOCIATION_RETAIN = 01401,       /**< Specifies a strong reference to the associated object.
//                                        *   The association is made atomically. */
//OBJC_ASSOCIATION_COPY = 01403          /**< Specifies that the associated object is copied.
//                                        *   The association is made atomically. */
typedef NS_ENUM(NSUInteger, DTOBJCAssociatedType) {
    DTOBJCAssociatedTypeAssign = 0,
    DTOBJCAssociatedTypeRetainNonatomic,
    DTOBJCAssociatedTypeCopyNonatomic,
    DTOBJCAssociatedTypeRetain,
    DTOBJCAssociatedTypeCopy
};

extern id _Nullable dt_runtimeGetAssociated(id _Nonnull objct, const void * _Nonnull key);
extern void dt_runtimeSetAssociated(id _Nonnull objct, const void * _Nonnull key, id _Nullable value, DTOBJCAssociatedType associateType);
extern void exchangeInstanceMethod(_Nonnull Class cls, SEL _Nonnull sel, SEL _Nonnull aSel);
// 第一个符号：#，字符串化
// 第二个符号：##，连接
// 第三个符号：@#，字符化
// 第四个符号：\，将两个行连接到一起，
#define DTDefine(k1, k2) #k1
