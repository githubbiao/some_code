//
//  DTButton.h
//  Demo
//
//  Created by WangDa Mac on 2019/5/8.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTControl.h"

NS_ASSUME_NONNULL_BEGIN

@interface DTButton : DTControl

+ (instancetype)button;

@property (nonatomic, strong, readwrite, nullable) UILabel *titleLabel;

@property (nonatomic, copy) IBInspectable NSString *text;
@property (nonatomic, assign) IBInspectable BOOL dtEnabel;
@property (nonatomic, assign) IBInspectable UIColor *bgColor;

@end

NS_ASSUME_NONNULL_END
