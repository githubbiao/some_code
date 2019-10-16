//
//  DTMessage.h
//  Demo
//
//  Created by WangDa Mac on 2019/5/7.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DTMessageResult) {
    DTMessageResultCancelled,
    DTMessageResultSent,
    DTMessageResultFailed
} API_AVAILABLE(ios(4.0)) ;

NS_ASSUME_NONNULL_BEGIN

@interface DTMessage : NSObject
+ (instancetype)messageManager;
+ (void)deleteManager;
- (void)sendMessage:(NSString *)message trRcipients:(NSArray <NSString *> *)recipients onVC:(__kindof UIViewController *)vc callback:(void(^)(DTMessageResult result))callback;
@end

NS_ASSUME_NONNULL_END
