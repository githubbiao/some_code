//
//  DTYYLockController.m
//  DTDemo02
//
//  Created by WangDa Mac on 2019/4/29.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTYYLockController.h"

@interface DTYYLockController ()
@property (nonatomic, strong) dispatch_semaphore_t lock;
@end

@implementation DTYYLockController

- (void)viewDidLoad {
    [super viewDidLoad];
    _lock = dispatch_semaphore_create(3);
    [self valid];
}


- (void)valid {
    NSArray *array = @[@1, @2, @3];
    CFBagRef bag = CFBagCreate(CFAllocatorGetDefault(), (__bridge void *)array, 10, &kCFTypeBagCallBacks);
    CFShow(bag);
}

@end


