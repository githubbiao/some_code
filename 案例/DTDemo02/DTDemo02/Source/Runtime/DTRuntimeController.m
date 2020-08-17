//
//  DTRuntimeController.m
//  DTDemo02
//
//  Created by WangDa Mac on 2019/4/26.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTRuntimeController.h"
#import "DTRuntime.h"
#import "DTAnimate.h"

@interface DTRuntimeController ()

@end

@implementation DTRuntimeController

+ (void)load {
   // exchangeInstanceMethod(self, @selector(viewWillAppear:), @selector(dt_viewWillAppear:));

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    exchangeInstancesMethod([DTAnimate class], @selector(logClassName), self.class, @selector(logClassName));
   
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)dt_viewWillAppear:(BOOL)animated {
    NSLog(@"--%s--", __func__);
    [self dt_viewWillAppear:animated];
}

- (void)addObserverAction {
    DTAnimate *animate = [[DTAnimate alloc] init];
    [animate logClassName];
    [animate addObserver:self forKeyPath:@"KVOInstance" options:(NSKeyValueObservingOptionNew) context:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        animate.KVOInstance = @"30000";
    });
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"---");
}

- (void)logClassName {
    NSLog(@"Class: %@", @"DTRuntimeController");
}

@end
