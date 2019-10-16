//
//  DTButton.m
//  Demo
//
//  Created by WangDa Mac on 2019/5/8.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTButton.h"

@implementation DTButton

+ (instancetype)button {
    return [[[self class] alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_addTitleLabel];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.bgColor = [UIColor redColor];
        [self p_addTitleLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _titleLabel.frame = self.bounds;
}


- (void)p_addTitleLabel {
    _titleLabel = [[UILabel alloc] init];
    [self addSubview:_titleLabel];
}

- (void)setBgColor:(UIColor *)bgColor {
    self.backgroundColor = bgColor;
}

@end
