//
//  NSObject+Safe.m
//  DTCommandLineApp
//
//  Created by WangDa Mac on 2019/6/24.
//  Copyright © 2019 黄启标. All rights reserved.
//

/*
 
 // < = iOS 8:下都是__NSArrayI
 //iOS9 @[] 是__NSArray0  @[@"fd"]是__NSArrayI
 //iOS10以后(含10): 分 __NSArrayI、  __NSArray0、__NSSingleObjectArrayI
 
 
 //__NSArrayM   NSMutableArray创建的都为__NSArrayM
 //__NSArray0   除__NSArrayM 0个元素都为__NSArray0
 // __NSSingleObjectArrayI @[@"fds"]只有此形式创建而且仅一个元素为__NSSingleObjectArrayI
 //__NSArrayI   @[@"fds",@"fsd"]方式创建多于1个元素 或者 arrayWith创建都是__NSArrayI
 
 
 
 //__NSArray0
 //arr@[11]   调用的是  [__NSArray0 objectAtIndex:]
 
 //__NSSingleObjectArrayI
 //arr@[11] 调用的是  [__NSSingleObjectArrayI objectAtIndex:]
 
 //不可变数组
 // <  iOS11： arr@[11]  调用的是[__NSArrayI objectAtIndex:]
 // >= iOS11： arr@[11]  调用的是[__NSArrayI objectAtIndexedSubscript]
 //  任意系统   [arr objectAtIndex:111]  调用的都是[__NSArrayM objectAtIndex:]
 
 //可变数组
 // <  iOS11： arr@[11]  调用的是[__NSArrayM objectAtIndex:]
 // >= iOS11： arr@[11]  调用的是[__NSArrayM objectAtIndexedSubscript]
 //  任意系统   [arr objectAtIndex:111]  调用的都是[__NSArrayI objectAtIndex:]
 
 
 大概和NSArray类似  也是iOS8之前都是__NSDictionaryI，其他的参考NSArray
 
 __NSSingleEntryDictionaryI
 @{@"key":@"value"} 此种形式创建而且仅一个可以为__NSSingleEntryDictionaryI
 __NSDictionaryM
 NSMutableDictionary创建都为__NSDictionaryM
 __NSDictionary0
 除__NSDictionaryM外 不管什么方式创建0个key都为__NSDictionary0
 __NSDictionaryI
 @{@"key":@"value",@"key2",@"value2"}此种方式创建多于1个key，或者initWith创建都是__NSDictionaryI
 
 // __NSSingleObjectArrayI, __NSArrayI, __NSArray0, __NSSingleObjectArrayI, NSArray
 // __NSPlaceholderDictionary, __NSDictionaryM
 
 */

#import "NSObject+CollectionSafe.h"
#import <objc/runtime.h>

void swizzle(Class originalClass, SEL originalSelector, Class swizzledClass, SEL swizzledSelector) {
    
    Method originalMethod = class_getInstanceMethod(originalClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(swizzledClass, swizzledSelector);
    
    BOOL didAddMethodInit = class_addMethod(originalClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethodInit) {
        class_addMethod(originalClass, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

void startCollectionSafe(void) {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzle(NSClassFromString(@"__NSPlaceholderArray"), NSSelectorFromString(@"initWithObjects:count:"), NSClassFromString(@"NSArray"), NSSelectorFromString(@"dt_initWithObjects:count:"));
        swizzle(NSClassFromString(@"__NSArray0"), NSSelectorFromString(@"objectAtIndex:"), NSClassFromString(@"NSArray"), NSSelectorFromString(@"dt_objectAtIndex:"));
        swizzle(NSClassFromString(@"__NSArrayM"), NSSelectorFromString(@"objectAtIndexedSubscript:"), NSClassFromString(@"NSMutableArray"), NSSelectorFromString(@"dt_objectAtIndexedSubscript:"));
        swizzle(NSClassFromString(@"__NSArrayM"), NSSelectorFromString(@"setObject:atIndexedSubscript:"), NSClassFromString(@"NSMutableArray"), NSSelectorFromString(@"dt_setObject:atIndexedSubscript:"));
        swizzle(NSClassFromString(@"__NSArrayM"), NSSelectorFromString(@"insertObject:atIndex:"), NSClassFromString(@"NSMutableArray"), NSSelectorFromString(@"dt_insertObject:atIndex:"));

        swizzle(NSClassFromString(@"__NSPlaceholderDictionary"), NSSelectorFromString(@"initWithObjects:forKeys:count:"), NSClassFromString(@"NSDictionary"), NSSelectorFromString(@"dt_initWithObjects:forKeys:count:"));
        swizzle(NSClassFromString(@"__NSDictionaryM"), NSSelectorFromString(@"setObject:forKey:"), NSClassFromString(@"NSMutableDictionary"), NSSelectorFromString(@"dt_setObject:forKey:"));
    });
   
}

@implementation NSArray (Safe)

- (id)dt_initWithObjects:(const id [])objects count:(NSUInteger)cnt {
    id newObjects[cnt];
    NSUInteger newObjectIndex = 0;
    for (int i=0; i<cnt; i++) {
        if (objects[i] != nil) {
            newObjects[newObjectIndex] = objects[i];
            newObjectIndex += 1;
        }
    }
    
    id newArray = [self dt_initWithObjects:newObjects count:newObjectIndex];
    return newArray;
}

- (id)dt_objectAtIndex:(NSUInteger)index {
    if (index < self.count) {
        return [self dt_objectAtIndex:index];
    }
    return nil;
}

@end

@implementation NSMutableArray (Safe)

- (id)dt_objectAtIndexedSubscript:(NSUInteger)idx {
    if (idx < self.count) {
        return [self dt_objectAtIndex:idx];
    }
    return nil;
}

- (void)dt_setObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    if (idx < self.count) {
        [self dt_setObject:obj atIndexedSubscript:idx];
    }
}

- (void)dt_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (index < self.count) {
        [self dt_setObject:anObject atIndexedSubscript:index];
    }
}

@end

@implementation NSDictionary (Safe)

- (id)dt_initWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt {
    id newObjects[cnt];
    id newKeys[cnt];
    NSUInteger newCnt = 0;
    for (int i=0; i<cnt; i++) {
        if (objects[i] != nil && keys[i] != nil) {
            newObjects[newCnt] = objects[i];
            newKeys[newCnt] = keys[i];
            newCnt += 1;
        }
    }
    id newDict = [self dt_initWithObjects:newObjects forKeys:newKeys count:newCnt];
    return newDict;
}

@end

@implementation NSMutableDictionary (Safe)

- (void)dt_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (anObject) {
        [self dt_setObject:anObject forKey:aKey];
    }
}

@end
