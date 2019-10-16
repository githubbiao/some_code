//
//  DTKeyValueObservationInfo.h
//  Demo
//
//  Created by WangDa Mac on 2019/5/10.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void* DTKeyValueVoidKey;

NS_ASSUME_NONNULL_BEGIN

@interface DTKeyValueContainerClass : NSObject
@property (nonatomic, readonly) Class originalClass;
@property (nonatomic, readonly) DTKeyValueVoidKey cachedObservationInfoImplementation;
@property (nonatomic, readonly) DTKeyValueVoidKey cachedSetObservationInfoImplementation;
@property (nonatomic, assign, readonly) BOOL cachedSetObservationInfoTakesAnObject;

@end

@interface DTKeyValueProperty : NSObject
@property (nonatomic, copy, readonly) NSString *keyPath;
@property (nonatomic, strong, readonly) DTKeyValueContainerClass *containerClass;
@end

@interface DTKeyValueUnnestedProperty : DTKeyValueProperty
@property (nonatomic, assign, readonly) BOOL cachedIsaForAutonotifyingIsValid;
@property (nonatomic, readonly) Class cachedIsaForAutonotifying;
@property (nonatomic, strong, readonly) id affectingProperties;
@end

@interface DTKeyValueObservance : NSObject
@property (nonatomic, strong, readonly) id observer;
@property (nonatomic, strong, readonly) DTKeyValueUnnestedProperty *property;
@property (nonatomic, strong, readonly) id context;
@property (nonatomic, strong, readonly) id originalObservable;
@end

@interface DTKeyValueObservationInfo : NSObject
@property (nonatomic, assign, readonly) BOOL cachedIsShareable;
@property (nonatomic, assign, readonly) unsigned long long cachedHash;
@property (nonatomic, strong, readonly, nullable) NSArray *observances;

@property (nonatomic, strong, readonly) id observationInfo;

+ (instancetype)keyValueObservationInfoWithKeyValueObservationInfo:(id)observationInfo;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;

@end

NS_ASSUME_NONNULL_END
