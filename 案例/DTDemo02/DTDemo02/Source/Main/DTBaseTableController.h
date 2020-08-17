//
//  DTBaseTableController.h
//  DTDemo02
//
//  Created by WangDa Mac on 2019/4/29.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DTBaseTableController : UITableViewController
@property (nonatomic, strong, readwrite) NSMutableArray <NSDictionary *>*rowDatas;
- (NSDictionary *)dictionaryWithTitle:(NSString *)title cls:(NSString *)cls;
@end

NS_ASSUME_NONNULL_END
