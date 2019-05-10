//
//  ViewController.m
//  Demo
//
//  Created by WangDa Mac on 2019/5/7.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "ViewController.h"
#import "DTNotificationCenter.h"
#import <UIKit/UIView.h>
#import "DTViewController.h"
#import "DTKeyValueObservationInfo.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *name;

@end

@implementation ViewController


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew) context:@"3000"];
    DTKeyValueObservationInfo *observationInfo = [DTKeyValueObservationInfo keyValueObservationInfoWithKeyValueObservationInfo:self.observationInfo];
   // NSArray *obs = observationInfo.observances;
    
    
    NSLog(@"---");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.name = @"------";
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == @"2000") {
        NSLog(@"------");
    } else if ([super respondsToSelector:@selector(observeValueForKeyPath:ofObject:change:context:)]) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    } else {
        NSLog(@"super not observer keyPath:%@, change:%@, object:%@.(In file %s)", keyPath, change, object, __FILE__);
    }
}



@end
