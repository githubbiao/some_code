//
//  DTCollectionSafe.m
//  DTDemo02
//
//  Created by WangDa Mac on 2019/5/6.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTCollectionSafe.h"
#import "DTRuntime.h"
@implementation NSArray (DTSafe)

- (id)dt_objectAtIndex:(NSUInteger)index {
    if (index > self.count-1) {
        NSLog(@"数组越界...");
        return nil;
    }
    return [self dt_objectAtIndex:index];
}

@end

@implementation NSMutableArray (DTSafe)

- (void)dt_addObject:(id)anObject {
    if (!anObject) {
        NSLog(@"数组插入空值1...");
        return;
    };
    [self dt_addObject:anObject];
}

- (void)dt_addObjectsFromArray:(NSArray *)otherArray {
    if (!otherArray || ![otherArray isKindOfClass:[NSArray class]]) {
        NSLog(@"数组插入空值2...");
        return;
    };
    [self dt_addObjectsFromArray:otherArray];
}

@end

@implementation NSMutableDictionary (DTSafe)

- (void)dt_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (!anObject || !aKey) {
        NSLog(@"字典设置object或key为nil");
        return;
    };
    [self dt_setObject:anObject forKey:aKey];
}

- (void)dt_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key {
    if (!obj || !key) {
        NSLog(@"字典设置object或key为nil");
        return;
    };
    [self dt_setObject:obj forKeyedSubscript:key];
}

@end

void exchangeCollectionMethod(void) {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        exchangeInstanceMethod([NSArray class], @selector(objectAtIndex:), @selector(dt_objectAtIndex:));
        exchangeInstanceMethod([NSMutableArray class], @selector(addObject:), @selector(dt_addObject:));
        exchangeInstanceMethod([NSMutableArray class], @selector(addObjectsFromArray:), @selector(dt_addObjectsFromArray:));
        exchangeInstanceMethod([NSMutableDictionary class], @selector(setObject:forKey:), @selector(dt_setObject:forKey:));
        exchangeInstanceMethod([NSMutableDictionary class], @selector(setObject:forKeyedSubscript:), @selector(dt_setObject:forKeyedSubscript:));
    });
}
