//
//  DTBaseViewController.m
//  Demo
//
//  Created by WangDa Mac on 2019/5/10.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTBaseViewController.h"

@interface DTBaseViewController ()

@end

@implementation DTBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == @"3000") {
        NSLog(@"接收到\"3000\"的通知");
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
