//
//  DTMessage.m
//  Demo
//
//  Created by WangDa Mac on 2019/5/7.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTMessage.h"
#import <MessageUI/MessageUI.h>

@interface DTMessage () <MFMessageComposeViewControllerDelegate>
@property (nonatomic, strong) void(^DTMessageResultCallback)(DTMessageResult result);
@end

@implementation DTMessage

static dispatch_once_t DTMessageOnceToken;
static DTMessage *_DTMessageManager = nil;
+ (instancetype)messageManager {
    dispatch_once(&DTMessageOnceToken, ^{
        _DTMessageManager = [[DTMessage alloc] init];
    });
    return _DTMessageManager;
}

- (void)sendMessage:(NSString *)message trRcipients:(NSArray <NSString *> *)recipients onVC:(__kindof UIViewController *)vc callback:(void(^)(DTMessageResult result))callback{
    _DTMessageResultCallback = [callback copy];
    MFMessageComposeViewController *msgVC = [[MFMessageComposeViewController alloc] init];
    msgVC.recipients = @[@"10010"];
    msgVC.body = @"10010";
    msgVC.messageComposeDelegate = self;
    [vc presentViewController:msgVC animated:YES completion:nil];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result  {
    [controller dismissViewControllerAnimated:YES completion:nil];
    _DTMessageResultCallback? _DTMessageResultCallback((DTMessageResult)result):nil;
    _DTMessageResultCallback = nil;
}

+ (void)deleteManager {
    DTMessageOnceToken = 0;
    _DTMessageManager = nil;
}


- (void)dealloc
{
    NSLog(@"_DTMessageManager dealloc");
}
@end
