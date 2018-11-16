//
//  ViewController.m
//  信号量测试
//
//  Created by huang qibiao on 2018/11/16.
//  Copyright © 2018 apple. All rights reserved.
//

#import "ViewController.h"
#import <os/lock.h>
// libkern.OSAtomic
#import <libkern/OSAtomic.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    // #import <libkern/OSAtomic.h>
    // 创建锁
    OSSpinLock spinLock = OS_SPINLOCK_INIT;
    // 加锁
    OSSpinLockLock(&spinLock);
    // 解锁
    OSSpinLockUnlock(&spinLock);
    
#pragma clang diagnostic pop

// #import <os/lock.h>
    os_unfair_lock_t unfairLock;
    unfairLock = &(OS_UNFAIR_LOCK_INIT);
    os_unfair_lock_lock(unfairLock);
    os_unfair_lock_unlock(unfairLock);
}


- (void)RecursiveLock {
    
    NSRecursiveLock *lock = [[NSRecursiveLock alloc]init];
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        NSLog(@"%d", __LINE__);
        [lock unlock];
    });
    
    dispatch_async(queue, ^{
        NSLog(@"%d", __LINE__);
        [lock unlock];
    });
    
    dispatch_async(queue, ^{
        NSLog(@"%d", __LINE__);
        [lock unlock];
    });
    
    dispatch_async(queue, ^{
        NSLog(@"%d", __LINE__);
        [lock unlock];
    });
    
    dispatch_async(queue, ^{
        NSLog(@"%d", __LINE__);
        [lock unlock];
    });
   
    
    dispatch_async(queue, ^{
        NSLog(@"%d", __LINE__);
        [lock unlock];
    });
    
    
    dispatch_async(queue, ^{
        NSLog(@"%d", __LINE__);
        [lock unlock];
    });
    
    [lock lock];
    [lock lock];
    [lock lock];
    [lock lock];
    [lock lock];
    [lock lock];
    [lock lock];
    dispatch_async(queue, ^{
        NSLog(@"Unlocked");
    });

}
- (void)barrier {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_group_async(group, queue, ^{
        NSLog(@"%d", __LINE__);
        sleep(1);
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"%d", __LINE__);
        sleep(1);
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"%d", __LINE__);
        sleep(1);

    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"%d", __LINE__);
        sleep(1);

    });
    
    dispatch_barrier_async(queue, ^{
        NSLog(@"barrier");
        sleep(1);

    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"%d", __LINE__);
        sleep(1);

    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"%d", __LINE__);
        sleep(1);
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"%d", __LINE__);
        sleep(1);
    });
    
}

- (void)dispatch_group_enter_leave {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_group_async(group, queue, ^{
        dispatch_group_enter(group);
        NSLog(@"%d", __LINE__);
    });
    dispatch_group_leave(group);
    
    dispatch_group_async(group, queue, ^{
        dispatch_group_enter(group);
        NSLog(@"%d", __LINE__);
    });
    dispatch_group_leave(group);
    
    dispatch_group_async(group, queue, ^{
        dispatch_group_enter(group);
        NSLog(@"%d", __LINE__);
    });
    dispatch_group_leave(group);
    
    dispatch_group_async(group, queue, ^{
        dispatch_group_enter(group);
        NSLog(@"%d", __LINE__);
    });
    dispatch_group_leave(group);
    
    dispatch_group_async(group, queue, ^{
        dispatch_group_enter(group);
        NSLog(@"%d", __LINE__);
    });
    dispatch_group_leave(group);
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"over");
    });
}

- (void)dispatch_semaphore_wait {
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("cc.swiftor.test", DISPATCH_QUEUE_CONCURRENT);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    dispatch_group_async(group, queue, ^{
        dispatch_semaphore_signal(semaphore);
        NSLog(@"%d", __LINE__);
    });
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"%d", __LINE__);
        dispatch_semaphore_signal(semaphore);
    });
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"%d", __LINE__);
        dispatch_semaphore_signal(semaphore);
    });
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    dispatch_group_async(group, queue, ^{
       NSLog(@"%d", __LINE__);
        dispatch_semaphore_signal(semaphore);
    });
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    dispatch_group_async(group, queue, ^{
       NSLog(@"%d", __LINE__);
        dispatch_semaphore_signal(semaphore);
    });
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"%d", __LINE__);
        NSLog(@"over!");
    });
}

@end
