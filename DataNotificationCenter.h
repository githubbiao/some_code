//
//  DataNotificationCenter.h
//  MGMNoti
//
//  Created by WangDa Mac on 2019/6/4.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataNotificationCenter : NSObject


/**
 单例，唯一可以获取实例的方法

 @return DataNotificationCenter
 */
+ (instancetype)defaultCenter;

- (instancetype)init NS_UNAVAILABLE;

/**
 注册通知事件

 @param name 待观察的属性的名字
 @param observerId 观察者唯一ID
 @param block 触发通知事件
 */
- (void)registeNotificationWithName:(NSString *)name
                         observerId:(NSString *)observerId
                         usingBlock:(void (^)(id _Nullable info))block;


/**
 适当时候取消已注册的事件，通常是在dealloc中调用，也可以在其他位置调用

 @param name 被观察事件的名字，如果为nil，则取消 observerId 注册过的所有事件
 @param observerId 被观察者唯一id
 */
- (void)unregisteNotificationWithName:(NSString *)name
                           observerId:(nullable NSString *)observerId;


/**
 触发通知事件

 @param aName 被关联的事件名字
 @param info 附属字段
 */
- (void)postNotificationWithName:(NSString *)aName info:(nullable id)info;
@end

NS_ASSUME_NONNULL_END
