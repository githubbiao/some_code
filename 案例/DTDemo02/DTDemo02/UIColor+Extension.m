//
//  UIColor+Extension.m
//  DTDemo02
//
//  Created by WangDa Mac on 2019/5/20.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)
- (UIImage *)circleImageWithR:(CGFloat)r fillColor:(UIColor *)fillColor{
    UIGraphicsBeginImageContext(CGSizeMake(r*2, r*2));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddArc(context, r, r, r, 0, M_PI*2, 0);
    [fillColor setFill];
    CGContextFillPath(context);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
