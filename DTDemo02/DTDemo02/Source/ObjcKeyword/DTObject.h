//
//  DTObject.h
//  demo
//
//  Created by WangDa Mac on 2019/4/16.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DTObject : NSObject
@end


@interface DTObject (){
@private NSInteger hashCode;
@public NSInteger increasingCount;
@protected NSInteger dtCount;
    @package NSInteger fileCount;
}

@property (nonatomic, copy, readwrite, nullable) NSString *objcIdentifier;
@property (nonatomic, copy, readonly) NSString *objcId;

@end

@interface DTObject (DTReset)
- (instancetype)resetObject;
- (void)addIncreasingCount;

@end

NS_ASSUME_NONNULL_END
