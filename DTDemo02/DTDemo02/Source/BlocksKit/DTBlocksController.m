//
//  DTBlocksController.m
//  DTDemo02
//
//  Created by WangDa Mac on 2019/4/29.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTBlocksController.h"
#import <BlocksKit/BlocksKit.h>

@interface DTBlocksController ()
@property (nonatomic, strong) NSMutableArray *strings;
@end

@implementation DTBlocksController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    _strings = @[@"1", @"2", @"3"].mutableCopy;
    [self micros];
}

- (void)micros {
   
    NSArray *selArray = BK_MAP(self.strings, [self bk_each:obj]);
    
    NSArray *blockArray = BK_MAP(self.strings, (^id(id objc){return [NSString stringWithFormat:@"block_%@", obj];})(obj));
    
    NSArray *oldArray = BK_MAP(self.strings, ({NSLog(@"%@", obj); obj;}));
    
    NSLog(@"selArray: %@\nblockArray:%@\noldArray:%@", selArray, blockArray, oldArray);
}


- (NSString *)bk_each:(id)object {
    NSString *newString = object;
    newString = [newString stringByAppendingString:@"_SEL"];
    return newString;
}

@end
