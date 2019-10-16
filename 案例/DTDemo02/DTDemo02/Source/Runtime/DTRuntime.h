//
//  DTRuntime.h
//  DTDemo02
//
//  Created by WangDa Mac on 2019/4/26.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import <UIKit/UIKit.h>

extern void exchangeInstancesMethod(Class cls, SEL sel, Class aClass, SEL aSel);
extern void exchangeInstanceMethod(Class cls, SEL sel, SEL aSel);
