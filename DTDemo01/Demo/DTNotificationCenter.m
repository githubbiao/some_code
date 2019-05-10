//
//  DTNotificationCenter.m
//  Demo
//
//  Created by WangDa Mac on 2019/5/9.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTNotificationCenter.h"
// MARK: - DTNotification
@interface DTNotification () <NSCopying>
@property (readwrite, copy) DTNotificationName name;
@property (nullable, readwrite, retain) id object;
@property (nullable, readwrite, copy) NSDictionary *userInfo;

@end
@implementation DTNotification
- (instancetype)initWithName:(DTNotificationName)name object:(id)object userInfo:(NSDictionary *)userInfo
{
    self = [super init];
    if (self) {
        _name = name;
        _object = object;
        _userInfo = userInfo;
    }
    return self;
}

- (id)copyWithZone:(nullable NSZone *)zone {
    return [[[self class] alloc] initWithName:_name object:_object userInfo:_userInfo];
}

@end

@interface __DTActionStorage : NSObject

@property (nonatomic, strong) id observer;
@property (nonatomic, assign) SEL aSelector;
@property (nonatomic, strong) DTNotification *notifaction;

@end

@implementation __DTActionStorage

- (instancetype)initWithObserver:(id)observer selector:(SEL)aSelector notifaction:(DTNotification *)notifaction
{
    self = [super init];
    if (self) {
        _observer = observer;
        _aSelector = aSelector;
        _notifaction = notifaction;
    }
    return self;
}

@end

@interface __DTObserver : NSObject
@property (nonatomic, strong) DTNotificationCenter *nc;
@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, copy) DTNotificationName name;
@property (nonatomic, strong) id object;
@property (nonatomic, strong) void (^DTObserverCallback)(DTNotification *note);
- (void)respondNotification;
@end
@implementation __DTObserver
- (void)respondNotification {}

- (void)dealloc {
    NSLog(@"%@(%@) is dealloc", self, self.name);
}

@end


@interface DTNotificationCenter ()

@property (nonatomic, strong) NSMutableDictionary *callbacks;
@property (nonatomic, strong) NSMutableDictionary <DTNotificationName, NSMutableArray <__DTActionStorage *>*> * actionStorage;
@end

@implementation DTNotificationCenter

static DTNotificationCenter *DT_NotificationDefaultCenter = nil;
+ (instancetype)defaultCenter {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DT_NotificationDefaultCenter = [[DTNotificationCenter alloc] init];
    });
    return DT_NotificationDefaultCenter;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _callbacks = @{}.mutableCopy;
        _actionStorage = @{}.mutableCopy;
    }
    return self;
}

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(nullable DTNotificationName)aName object:(nullable id)anObject {
    DTNotification *notification = [[DTNotification alloc] initWithName:aName object:anObject userInfo:nil];
    __DTActionStorage *actionStorage = [[__DTActionStorage alloc] initWithObserver:observer selector:aSelector notifaction:notification];
    NSMutableArray *actions = [self.actionStorage valueForKey:notification.name];
    if (!actions) {
        actions = @[].mutableCopy;
    }
    [actions addObject:actionStorage];
    [self.actionStorage setValue:actions forKey:aName];
    
}

- (id <NSObject>)addObserverForName:(nullable DTNotificationName)name object:(nullable id)obj queue:(nullable NSOperationQueue *)queue usingBlock:(void (^)(DTNotification *note))block {
    __DTObserver *observer = [[__DTObserver alloc] init];
    observer.queue = queue;
    observer.DTObserverCallback = block;
    observer.name = name;
    [self addObserver:observer selector:@selector(respondNotification) name:name object:obj];
    return observer;
}

- (void)postNotification:(DTNotification *)notification {
    NSMutableArray *actions = [self.actionStorage valueForKey:notification.name];
    if (actions.count == 0) return;
    for (__DTActionStorage *actionStorage in actions) {
        [self performActionWithActionStorage:actionStorage withNotifiaction:notification];
    }
}
- (void)postNotificationName:(DTNotificationName)aName object:(nullable id)anObject {
    [self postNotificationName:aName object:anObject userInfo:nil];
}
- (void)postNotificationName:(DTNotificationName)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo {
    NSMutableArray *actions = [self.actionStorage valueForKey:aName];
    if (actions.count == 0) return;
    for (__DTActionStorage *actionStorage in actions) {
        if (actionStorage.observer || actionStorage.aSelector) {
            DTNotification *noti = actionStorage.notifaction.copy;
            if (aUserInfo) {
                noti.userInfo = aUserInfo;
            }
            [self performActionWithActionStorage:actionStorage withNotifiaction:noti];
        }
    }
}

- (void)performActionWithActionStorage:(__DTActionStorage *)actionStorage withNotifiaction:(DTNotification *)notification {
    if ([actionStorage.observer isKindOfClass:[__DTObserver class]]) {
        __weak __DTObserver *observer = (__DTObserver *)actionStorage.observer;
        [observer.queue addOperationWithBlock:^{
            observer.DTObserverCallback? observer.DTObserverCallback(notification) : nil;
        }];
    } else if (actionStorage.observer || actionStorage.aSelector) {
        [actionStorage.observer performSelectorOnMainThread:actionStorage.aSelector withObject:notification waitUntilDone:0.f];
    }
}


- (void)removeObserver:(id)observer {
    for (DTNotificationName name in self.actionStorage.allKeys) {
        NSMutableArray *actionStorages = self.actionStorage[name];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.observer = %@", observer];
        NSArray *desc = [actionStorages filteredArrayUsingPredicate:predicate];
        [actionStorages removeObjectsInArray:desc];
    }
}
- (void)removeObserver:(id)observer name:(nullable DTNotificationName)aName object:(nullable id)anObject {
    for (DTNotificationName name in self.actionStorage.allKeys) {
        NSMutableArray *actionStorages = self.actionStorage[name];
        NSMutableArray *removedStorages = @[].mutableCopy;
        for (__DTActionStorage *actionStorage in actionStorages) {
            if ([actionStorage.observer isEqual:observer] && [actionStorage.notifaction.name isEqualToString:aName] && [actionStorage.notifaction.object isEqual:anObject]) {
                [removedStorages addObject:actionStorage];
            }
        }
        [actionStorages removeObjectsInArray:removedStorages];
    }
}

@end
