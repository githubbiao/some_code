//
//  DTMainViewController.m
//  DTDemo02
//
//  Created by WangDa Mac on 2019/4/26.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTMainViewController.h"

@interface DTMainViewController ()

@property (nonatomic, strong, readwrite, nullable) NSArray <NSDictionary *>*childVCInfos;

@end

@implementation DTMainViewController

- (NSArray *)childVCInfos {
    if (!_childVCInfos) {
        NSString *plistPath = [NSBundle.mainBundle pathForResource:@"cls.plist" ofType:nil];
        _childVCInfos = [NSArray arrayWithContentsOfFile:plistPath];
    }
    return _childVCInfos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    self.tableView.estimatedRowHeight = 0.f;
    self.tableView.estimatedSectionHeaderHeight = 0.f;
    self.tableView.estimatedSectionFooterHeight = 0.f;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.childVCInfos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.childVCInfos[indexPath.row][@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cls = self.childVCInfos[indexPath.row][@"cls"];
    if (!cls.length) return;
    UIViewController *vc = [NSClassFromString(cls) new];
    vc.title = self.childVCInfos[indexPath.row][@"title"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
