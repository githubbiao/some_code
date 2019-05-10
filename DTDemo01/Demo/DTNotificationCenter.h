//
//  DTNotificationCenter.h
//  Demo
//
//  Created by WangDa Mac on 2019/5/9.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSString * DTNotificationName;
NS_ASSUME_NONNULL_BEGIN

@interface DTNotification : NSObject
@property (readonly, copy) DTNotificationName name;
@property (nullable, readonly, retain) id object;
@property (nullable, readonly, copy) NSDictionary *userInfo;
- (instancetype)initWithName:(DTNotificationName)name object:(nullable id)object userInfo:(nullable NSDictionary *)userInfo;
- (instancetype)init NS_UNAVAILABLE;
@end

@interface DTNotificationCenter : NSObject
//
@property (class, readonly, strong) DTNotificationCenter *defaultCenter;


- (void)postNotification:(DTNotification *)notification;
- (void)postNotificationName:(DTNotificationName)aName object:(nullable id)anObject;
- (void)postNotificationName:(DTNotificationName)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;

- (void)removeObserver:(id)observer;
- (void)removeObserver:(id)observer name:(nullable DTNotificationName)aName object:(nullable id)anObject;



- (void)addObserver:(id)observer selector:(SEL)aSelector name:(nullable DTNotificationName)aName object:(nullable id)anObject;
- (id <NSObject>)addObserverForName:(nullable DTNotificationName)name object:(nullable id)obj queue:(nullable NSOperationQueue *)queue usingBlock:(void (^)(DTNotification *note))block; // API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
//// The return value is retained by the system, and should be held onto by the caller in
//// order to remove the observer with removeObserver: later, to stop observation.

@end

NS_ASSUME_NONNULL_END
