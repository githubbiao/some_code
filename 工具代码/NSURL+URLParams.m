//
//  NSURL+Params.m
//  DTCommandLineApp
//
//  Created by WangDa Mac on 2019/6/14.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "NSURL+URLParams.h"

@implementation NSURL (URLParams)

- (id)findValueWithURLParamName:(NSString *)paramName {
    
    __block id value = nil;
    NSString *params = [self.absoluteString componentsSeparatedByString:@"?"].lastObject;
    if (params && params.length > 0) {
        NSArray *keyvalues = [params componentsSeparatedByString:@"&"];
        [keyvalues enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSArray *keyValue = [obj componentsSeparatedByString:@"="];
            if ([keyValue.firstObject isEqualToString:paramName]) {
                value = keyValue.lastObject;
                *stop = YES;
            }
        }];
    }
    return value;
}

- (NSDictionary *)getAllURLParams {
    
    NSString *params = [self.absoluteString componentsSeparatedByString:@"?"].lastObject;
    
    __block NSMutableDictionary *requestParams = [[NSMutableDictionary alloc] init];
    if (params && params.length > 0) {
        NSArray *keyvalues = [params componentsSeparatedByString:@"&"];
        [keyvalues enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSArray *keyValue = [obj componentsSeparatedByString:@"="];
            if (keyValue.count == 2) {
                [requestParams setObject:keyValue.lastObject forKey:keyValue.firstObject];
            }
        }];
    }
    return requestParams.copy;
}

@end
