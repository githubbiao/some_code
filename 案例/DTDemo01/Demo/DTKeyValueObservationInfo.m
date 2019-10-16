//
//  DTKeyValueObservationInfo.m
//  Demo
//
//  Created by WangDa Mac on 2019/5/10.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTKeyValueObservationInfo.h"
#import <objc/runtime.h>
void copyPropertys(id from, id to);

@interface DTKeyValueContainerClass ()
@property (nonatomic) Class originalClass;
@property (nonatomic) DTKeyValueVoidKey cachedObservationInfoImplementation;
@property (nonatomic) DTKeyValueVoidKey cachedSetObservationInfoImplementation;
@property (nonatomic, assign, readwrite) BOOL cachedSetObservationInfoTakesAnObject;

@end

@interface DTKeyValueProperty ()
@property (nonatomic, copy, readwrite) NSString *keyPath;
@property (nonatomic, strong, readwrite) DTKeyValueContainerClass *containerClass;
@end

@interface DTKeyValueUnnestedProperty ()
@property (nonatomic, assign, readwrite) BOOL cachedIsaForAutonotifyingIsValid;
@property (nonatomic) Class cachedIsaForAutonotifying;
@property (nonatomic, strong) id affectingProperties;
@end

@interface DTKeyValueObservance ()
@property (nonatomic, strong, readwrite) id observer;
@property (nonatomic, strong, readwrite) DTKeyValueUnnestedProperty *property;
@property (nonatomic, strong, readwrite, nullable) id context;
@property (nonatomic, strong, readwrite, nullable) id originalObservable;
@end

@interface DTKeyValueObservationInfo ()
@property (nonatomic, assign, readwrite) BOOL cachedIsShareable;
@property (nonatomic, assign, readwrite) unsigned long long cachedHash;
@property (nonatomic, strong, readwrite, nullable) NSArray *observances;
@property (nonatomic, strong, readwrite) id observationInfo;

@end

@implementation DTKeyValueContainerClass

@end

@implementation DTKeyValueProperty
@end

@implementation DTKeyValueUnnestedProperty
@end

@implementation DTKeyValueObservance
@end

@implementation DTKeyValueObservationInfo

+ (instancetype)keyValueObservationInfoWithKeyValueObservationInfo:(id)observationInfo {
    DTKeyValueObservationInfo *info = [[DTKeyValueObservationInfo alloc] initWithKeyValueObservationInfo:observationInfo];
    return info;
}

- (instancetype)initWithKeyValueObservationInfo:(id)observationInfo
{
    self = [super init];
    if (self) {
        if ([observationInfo isKindOfClass:NSClassFromString(@"NSKeyValueObservationInfo")]) {
            _observationInfo = observationInfo;
            copyPropertys(observationInfo, self);
        }
    }
    return self;
}


@end


void copyPropertys(id from, id to) {
    
    unsigned int fromOutCount = 0;
    Ivar *ivars = class_copyIvarList([from class], &fromOutCount);
    for (int fi=0; fi<fromOutCount; fi++) {
        Ivar ivar = ivars[fi];
        __unused const char *ivarName = ivar_getName(ivar);
        __unused const char *ivarEncoding = ivar_getTypeEncoding(ivar);
        __unused long ivarOffset = ivar_getOffset(ivar);
       __unused id value = object_getIvar(from, ivar);
        
        
        NSLog(@"----");
    }
}
