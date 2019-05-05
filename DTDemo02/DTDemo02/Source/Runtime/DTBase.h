//
//  DTBase.h
//  DTDemo02
//
//  Created by WangDa Mac on 2019/4/26.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DTBase : NSObject
@property (nonatomic, strong) NSString *KVOInstance;
- (void)logClassName;

@end

NS_ASSUME_NONNULL_END
