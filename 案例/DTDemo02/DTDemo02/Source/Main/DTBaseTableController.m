//
//  DTBaseTableController.m
//  DTDemo02
//
//  Created by WangDa Mac on 2019/4/29.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTBaseTableController.h"

@interface DTBaseTableController ()

@end

@implementation DTBaseTableController

- (instancetype)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rowDatas = @[].mutableCopy;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"id"];
    self.tableView.rowHeight = 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rowDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.rowDatas[indexPath.row][@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cls = self.rowDatas[indexPath.row][@"cls"];
    if (!cls) return;
    NSString *title = self.rowDatas[indexPath.row][@"title"];
    UIViewController *vc = [NSClassFromString(cls) new];
    vc.title = title;
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSDictionary *)dictionaryWithTitle:(NSString *)title cls:(NSString *)cls {
    return @{@"title":title, @"cls":cls};
}


@end
