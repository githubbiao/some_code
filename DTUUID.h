//
//  DTUUID.h
//  DTCommandLineApp
//
//  Created by WangDa Mac on 2019/6/25.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface DTUUID : NSObject<NSCopying, NSSecureCoding>
+ (instancetype)UUID;
- (nullable instancetype)initWithUUIDBytes:(const uuid_t _Nullable)bytes;
- (nullable instancetype)initWithUUIDString:(NSString *)string;
- (void)getUUIDBytes:(uuid_t _Nonnull)uuid;
@property (readonly, copy) NSString *UUIDString;

- (NSString *)lowerUUIDString;
- (NSString *)upperUUIDString;
@end

extern NSString *RandomUUIDString(void);

NS_ASSUME_NONNULL_END
