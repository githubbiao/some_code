//
//  DTGF.h
//  DTTest
//
//  Created by WangDa Mac on 2019/5/15.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DTGF : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSString *addr;
@property (nonatomic, copy) NSString *hoby;

+ (instancetype)DTGFWithName:(NSString *)name age:(NSInteger)age addr:(NSString *)addr hoby:(NSString *)hoby;
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age addr:(NSString *)addr hoby:(NSString *)hoby;
@end

NS_ASSUME_NONNULL_END
