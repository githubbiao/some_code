//
//  DTObject.m
//  demo
//
//  Created by WangDa Mac on 2019/4/16.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTObject.h"

@implementation DTObject {
    NSString *_objcId;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _objcId = [NSUUID UUID].UUIDString;
        self->hashCode = [self hash];
    }
    return self;
}

- (NSString *)objcId {
    return _objcId;
}

@end

@implementation DTObject (DTReset)

- (instancetype)resetObject {
    return [[self class] new];
}

- (void)addIncreasingCount {
    self->increasingCount += 1;
}

@end
