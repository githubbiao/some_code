//
//  DTGF.m
//  DTTest
//
//  Created by WangDa Mac on 2019/5/15.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTGF.h"

@implementation DTGF

+ (instancetype)DTGFWithName:(NSString *)name age:(NSInteger)age addr:(NSString *)addr hoby:(NSString *)hoby {
    return [[[self class]alloc]initWithName:name age:age addr:addr hoby:hoby];
}

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age addr:(NSString *)addr hoby:(NSString *)hoby
{
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
        _addr = addr;
        _hoby = hoby;
    }
    return self;
}

@end
