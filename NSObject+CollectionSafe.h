//
//  NSObject+Safe.h
//  DTCommandLineApp
//
//  Created by WangDa Mac on 2019/6/24.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern void startCollectionSafe(void);

@interface NSArray (Safe)
@end

@interface NSMutableArray (Safe)
@end

@interface NSDictionary (Safe)
@end

@interface NSMutableDictionary (Safe)
@end

NS_ASSUME_NONNULL_END
