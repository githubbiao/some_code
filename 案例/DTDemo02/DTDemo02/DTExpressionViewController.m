//
//  DTExpressionViewController.m
//  DTDemo02
//
//  Created by WangDa Mac on 2019/5/20.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTExpressionViewController.h"
#import "DTGF.h"
@interface DTExpressionViewController ()
@property (nonatomic, strong) UIView *layerView;

@end

@implementation DTExpressionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)testPredicate {
    
    // MARK: - 表达式教程
    // https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Predicates/Articles/pCreating.html#//apple_ref/doc/uid/TP40001793-210173
    // https://www.jianshu.com/p/5c220042b78d
    // https://www.jb51.net/article/136384.htm
    
    
    // NSPredicate
    // NSComparisonPredicate
    // NSCompoundPredicate
    // NSExpression
    // NSRegularExpression
    //    [NSPredicate class];
    //    [NSComparisonPredicate class];
    //    [NSCompoundPredicate class];
    //    [NSExpression class];
    //    [NSRegularExpression class];
    /*
     [NSPredicate predicateWithFormat:@"SELF.age<%@ AND SELF.name=%@" argumentArray:@[@20, @"Kitty"]]
     formt: age < 20 AND name == "Kitty"
     + (NSPredicate *)predicateWithFormat:(NSString *)predicateFormat argumentArray:(nullable NSArray *)arguments;
     */
    
    /*
     [NSPredicate predicateWithFormat:@"SELF.age<20 && SELF.name == \"Kitty\""]
     [NSPredicate predicateWithFormat:@"SELF.name==%@ AND SELF.age=%@", @"Lucy", @20]
     format: age < 20 AND name == "Kitty"
     + (NSPredicate *)predicateWithFormat:(NSString *)predicateFormat, ...;
     */
    
    /*
     未发现用法
     + (NSPredicate *)predicateWithFormat:(NSString *)predicateFormat arguments:(va_list)argList;
     */
    
    /*
     iOS, watchOS, tvOS 不可用
     + (nullable NSPredicate *)predicateFromMetadataQueryString:(NSString *)queryString API_AVAILABLE(macos(10.9)) API_UNAVAILABLE(ios, watchos, tvos);
     */
    
    /*
     format: @"TRUEPREDICATE" OR @"FALSEPREDICATE"
     + (NSPredicate *)predicateWithValue:(BOOL)value;    // return predicates that always evaluate to true/false
     */
    
    /*
     format: BLOCKPREDICATE 这个很好用
     + (NSPredicate*)predicateWithBlock:(BOOL (^)(id _Nullable evaluatedObject, NSDictionary<NSString *, id> * _Nullable bindings))block API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
     */
    
    /*
     @interface DTGF : NSObject
     
     @property (nonatomic, copy) NSString *name;
     @property (nonatomic, assign) NSInteger age;
     @property (nonatomic, copy) NSString *addr;
     @property (nonatomic, copy) NSString *hoby;
     
     + (instancetype)DTGFWithName:(NSString *)name age:(NSInteger)age addr:(NSString *)addr hoby:(NSString *)hoby;
     - (instancetype)initWithName:(NSString *)name age:(NSInteger)age addr:(NSString *)addr hoby:(NSString *)hoby;
     @end
     
     
     */
    
    DTGF *dtgf1 = [DTGF DTGFWithName:@"Lucy" age:20 addr:@"US" hoby:@"PingKay"];
    DTGF *dtgf2 = [DTGF DTGFWithName:@"Kitty" age:18 addr:@"EN" hoby:@"cook"];
    DTGF *dtgf3 = [DTGF DTGFWithName:@"Meng" age:19 addr:@"JP" hoby:@"Sing"];
    NSArray *gf = @[dtgf1, dtgf2, dtgf3];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name==%@ AND SELF.age=%@", @"Lucy", @20];
    
    NSString *format = predicate.predicateFormat;
    NSArray *newArray = [gf filteredArrayUsingPredicate:predicate];
    
    NSLog(@"newArray.count = %ld(filter predicate:%@)", newArray.count, format);
}

- (void)testLayer {
    _layerView = [[UIView alloc] initWithFrame:CGRectMake(15, 100, 300, 100)];
    [self.view addSubview:_layerView];
    
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    gradientLayer.frame = _layerView.bounds;
    gradientLayer.colors = @[(__bridge id)UIColor.redColor.CGColor,
                             (__bridge id)UIColor.yellowColor.CGColor,
                             (__bridge id)UIColor.greenColor.CGColor,
                             (__bridge id)UIColor.blueColor.CGColor];
    // gradientLayer.transform = CATransform3DMakeRotation(M_PI_2/2/ 2, 0, 0, 1);
    [_layerView.layer addSublayer:gradientLayer];
}



/**
 第三方字体示例
 
 1. `info.plist` 中添加
    `Fonts provided by application`: array [xx.ttf]
 2. `Build Phases` -> `Copy Bundle Resource` -> add  `xx.ttf`
 3.  Log, find property font name
 ```
    NSArray *familyNames = [UIFont familyNames];
    for (NSString *familyName in familyNames) {
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for (NSString *fontName in fontNames) {
            printf("\tFont: %s \n", [fontName UTF8String]);
        }
    }
 4. user `[UIFont fontWithName:@"FZJLJW--GB1-0" size:16]`
 ```
 */
- (void)testFont {
    self.title = @"字体测试";
    UIFont *font = [UIFont fontWithName:@"FZJLJW--GB1-0" size:16];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:font}];
    
    NSString *text = @"2007年4月27日，方正电子携手徐静蕾发布了其个人书法计算机字库产品，这款被命名为“方正静蕾简体”被方正方面称为我国第一款真正意义上的个人书法计算机字库产品，宣称标志着“计算机字库”将进入个性化时代。按照GB2312国家标准，6763个汉字，682个标点符号，94个包括英文字母和数字在内的ASCII字符，书写在有100多个1.2厘米见方格子的A4纸上。字体骨骼清秀、遒劲有力，清冽而又优雅、从容，令人赏心悦目。字如其人，心素如简，人淡如菊。特别适用于书写信函、报告、文章等。";
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.font = font;
    label.text = text;
    label.frame = CGRectMake(15, 200, 300, 400);
    [self.view addSubview:label];
}

@end
