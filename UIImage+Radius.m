//
//  UIImage+Radius.m
//  DTDemo
//
//  Created by WangDa Mac on 2019/6/13.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "UIImage+Radius.h"

@implementation UIImage (Radius)


- (UIImage*)imageWithCornerRadius:(CGFloat)radius {
    
    CGRect rect = (CGRect){0 ,0, self.size};
    // size——同UIGraphicsBeginImageContext,参数size为新创建的位图上下文的大小
    // opaque—透明开关，如果图形完全不用透明，设置为YES以优化位图的存储。
    // scale—–缩放因子
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    // 根据矩形画带圆角的曲线
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
    [self drawInRect:rect];
    // 图片缩放，是非线程安全的
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    return image;
}

@end
