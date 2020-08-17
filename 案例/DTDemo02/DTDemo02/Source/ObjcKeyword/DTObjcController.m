//
//  DTObjcController.m
//  DTDemo02
//
//  Created by WangDa Mac on 2019/4/29.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTObjcController.h"
#import "DTObject.h"

@interface DTObjcController ()

@end

@implementation DTObjcController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)dtObject {
    DTObject *objc = [DTObject new];
    [objc addIncreasingCount];
    NSLog(@"%ld", objc->increasingCount);
}

@end
