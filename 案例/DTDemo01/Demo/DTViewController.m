//
//  DTViewController.m
//  Demo
//
//  Created by WangDa Mac on 2019/5/9.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTViewController.h"
#import "DTNotificationCenter.h"

@interface DTViewController ()
@property (nonatomic, strong, readwrite, nullable) id localeChangeObserver;
@property (nonatomic, strong, readwrite, nullable) id tk;
@end

@implementation DTViewController

__weak DTViewController *__vc = nil;

- (void)viewDidLoad {
    __vc = self;
    [super viewDidLoad];
   _tk = [[DTNotificationCenter defaultCenter] addObserverForName:@"name123" object:@"20" queue:[NSOperationQueue mainQueue] usingBlock:^(DTNotification * _Nonnull note) {
        NSLog(@"-----");
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[DTNotificationCenter defaultCenter] postNotificationName:@"name123" object:nil];
}

- (void)dealloc {
    // [[DTNotificationCenter defaultCenter] removeObserver:_tk];
    [[DTNotificationCenter defaultCenter] removeObserver:_tk name:@"name123" object:@"20"];
    
}

@end
