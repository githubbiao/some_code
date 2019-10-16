//
//  DataNotificationCenter.m
//  MGMNoti
//
//  Created by WangDa Mac on 2019/6/4.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DataNotificationCenter.h"

typedef void(^DataNotificationCenterBlock)(id _Nullable info);

@interface DataNotificationCenter ()

@property (nonatomic, strong, readwrite) NSMutableDictionary *notiInfos;

@end

@implementation DataNotificationCenter

+ (instancetype)defaultCenter {
    static DataNotificationCenter *__defaultDataNotificationCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __defaultDataNotificationCenter = [[DataNotificationCenter alloc]initFromSuper];
    });
    return __defaultDataNotificationCenter;
}

- (void)registeNotificationWithName:(NSString *)name
                         observerId:(NSString *)observerId
                         usingBlock:(void (^)(id info))block {
    if (!name || !observerId || !block) {
        return;
    }
    NSMutableDictionary *notificationInfos = [self allNotificationInfosForNotificatioName:name];
    
    NSMutableArray *observerCallbacks = notificationInfos[observerId];
    if (!observerCallbacks) {
        observerCallbacks = [[NSMutableArray alloc] init];
    }
    [observerCallbacks addObject:block];
    [notificationInfos setObject:observerCallbacks forKey:observerId];
}

- (void)unregisteNotificationWithName:(NSString *)name
                           observerId:(NSString *)observerId {
    if (!observerId) {
        return;
    }
    if (name) {
        NSMutableDictionary *notificationInfos = [self allNotificationInfosForNotificatioName:name];
        [notificationInfos removeObjectForKey:observerId];
    } else {
       NSArray *allNotifiactionInfos = self.notiInfos.allValues;
        [allNotifiactionInfos enumerateObjectsUsingBlock:^(NSMutableDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj removeObjectForKey:observerId];
        }];
    }
    NSLog(@"------");
}

- (void)postNotificationWithName:(NSString *)aName info:(id)info {
    if (!aName) {
        return;
    }
    NSMutableDictionary *notificationInfos = [self allNotificationInfosForNotificatioName:aName];
    for (NSArray *blocks in notificationInfos.allValues) {
        for (DataNotificationCenterBlock block in blocks) {
            block(info);
        }
    }
}

- (NSMutableDictionary *)allNotificationInfosForNotificatioName:(NSString *)notificationName {
    NSMutableDictionary *allNotificationInfos = self.notiInfos[notificationName];
    if (!allNotificationInfos) {
        allNotificationInfos = [[NSMutableDictionary alloc] init];
        self.notiInfos[notificationName] = allNotificationInfos;
    }
    return allNotificationInfos;
}

- (instancetype)initFromSuper {
    self = [super init];
    return self;
}

- (NSMutableDictionary *)notiInfos {
    if (!_notiInfos) {
        _notiInfos = [[NSMutableDictionary alloc] init];
    }
    return _notiInfos;
}

@end
