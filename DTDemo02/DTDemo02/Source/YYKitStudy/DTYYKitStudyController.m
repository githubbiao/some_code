//
//  DTYYKitStudyController.m
//  DTDemo02
//
//  Created by WangDa Mac on 2019/4/29.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTYYKitStudyController.h"

@interface DTYYKitStudyController ()

@end

@implementation DTYYKitStudyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.rowDatas addObject:[self dictionaryWithTitle:@"YYKit中的🔐" cls:@"DTYYLockController"]];
    [self.tableView reloadData];
}



@end
