//
//  NSURL+Params.h
//  DTCommandLineApp
//
//  Created by WangDa Mac on 2019/6/14.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (URLParams)

- (id)findValueWithURLParamName:(NSString *)paramName;
- (NSDictionary *)getAllURLParams;

@end

NS_ASSUME_NONNULL_END
