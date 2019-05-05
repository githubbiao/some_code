//
//  DTCFoundationController.m
//  DTDemo02
//
//  Created by WangDa Mac on 2019/4/29.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTCFoundationController.h"
#import <CoreFoundation/CoreFoundation.h>
@interface DTCFoundationController ()

@end

@implementation DTCFoundationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // [self uuid];
    // [self test_array_01];
    [self test_dictionary_01];
}

- (void)uuid {
    CFUUIDRef UUID = CFUUIDCreate(CFAllocatorGetDefault());
    CFStringRef UUIDString = CFUUIDCreateString(CFAllocatorGetDefault(), UUID);
    NSString *ns_UUID = (__bridge_transfer NSString *)UUIDString;
    NSLog(@"UUID: %@", ns_UUID);
    // CFRelease(UUIDString);
    CFRelease(UUID);
}

- (void)test_array_01 {
    CFMutableArrayRef arrayM = CFArrayCreateMutable(CFAllocatorGetDefault(), 10, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(arrayM, (__bridge CFStringRef)(@"20000+1"));
    CFArrayAppendValue(arrayM, (__bridge_retained CFNumberRef)(@30));
    CFIndex count = CFArrayGetCount(arrayM);
    CFArrayRemoveValueAtIndex(arrayM, 1);
    NSLog(@"Befor Count:%ld", count);
    CFArrayAppendValue(arrayM, (__bridge void *)(@"CBD"));
    CFShow(arrayM);
    
}

- (void)test_dictionary_01 {
    CFMutableDictionaryRef dict = CFDictionaryCreateMutable(CFAllocatorGetDefault(), 10, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryAddValue(dict, CFSTR("name"), CFSTR("史丹利"));
    CFDictionaryAddValue(dict, CFSTR("age"), (__bridge_retained CFNumberRef)(@20));
    CFIndex count = CFDictionaryGetCount(dict);
    CFNumberRef age = CFDictionaryGetValue(dict, CFSTR("age"));
    CFShow(dict);
    NSLog(@"count: %ld,\nage=%@", count, (__bridge_transfer NSNumber *)age);
}

@end
