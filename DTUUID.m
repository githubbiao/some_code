//
//  DTUUID.m
//  DTCommandLineApp
//
//  Created by WangDa Mac on 2019/6/25.
//  Copyright © 2019 黄启标. All rights reserved.
//

#import "DTUUID.h"
#include <uuid/uuid.h>
@interface DTUUID (){
    uuid_t _uuid;
}

@end

@implementation DTUUID

+ (instancetype)UUID {
    return [[[self class] alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        uuid_generate_random(_uuid);
    }
    return self;
}

- (nullable instancetype)initWithUUIDBytes:(const uuid_t _Nullable)bytes {
    if (uuid_is_null(bytes)) return nil;
    self = [self init];
    if (self) {
        uuid_copy(_uuid, bytes);
    }
    return self;
}

- (nullable instancetype)initWithUUIDString:(NSString *)string {
    uuid_t uuid;
    uuid_parse(string.UTF8String, uuid);
    if (uuid_is_null(uuid)) return nil;
    self = [self init];
    if (self) {
        uuid_copy(_uuid, uuid);
        uuid_clear(uuid);
    }
    return self;
}

- (void)getUUIDBytes:(uuid_t _Nonnull)uuid {
    if (uuid_is_null(uuid)) uuid_copy(_uuid, uuid);
}

- (NSString *)UUIDString {
    if (uuid_is_null(_uuid) == 0) {
        uuid_string_t parse;
        uuid_unparse_upper(_uuid, parse);
        NSString *UUIDString = [NSString stringWithCString:parse encoding:NSUTF8StringEncoding];
        return UUIDString;
    }
    return nil;
}

- (NSString *)lowerUUIDString {
    if (uuid_is_null(_uuid) == 0) {
        uuid_string_t parse;
        uuid_unparse_lower(_uuid, parse);
        NSString *UUIDString = [NSString stringWithCString:parse encoding:NSUTF8StringEncoding];
        return UUIDString;
    }
    return nil;
}
- (NSString *)upperUUIDString {
    if (uuid_is_null(_uuid) == 0) {
        uuid_string_t parse;
        uuid_unparse_upper(_uuid, parse);
        NSString *UUIDString = [NSString stringWithCString:parse encoding:NSUTF8StringEncoding];
        return UUIDString;
    }
    return nil;
}

- (void)dealloc
{
    if (uuid_is_null(_uuid) == 0) {
        uuid_clear(_uuid);
    }
}

- (id)copyWithZone:(NSZone *)zone {
    DTUUID *uuid = [[DTUUID alloc] initWithUUIDBytes:_uuid];
    return uuid;
}

- (BOOL)isEqualTo:(DTUUID *)object {
    return uuid_compare(_uuid, object->_uuid) == 0;
}

+ (BOOL)supportsSecureCoding
{
    return YES;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if (self.UUIDString) {
        [aCoder encodeObject:self.UUIDString forKey:NSStringFromSelector(@selector(name))];
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        
        NSString *UUIDString = [aDecoder decodeObjectOfClass:[NSString class] forKey:NSStringFromSelector(@selector(name))];
        if (UUIDString) {
            uuid_t uuid;
            uuid_parse(UUIDString.UTF8String, uuid);
            
            if (uuid_is_null(uuid)) {
                uuid_copy(_uuid, uuid);
                uuid_clear(uuid);
            }
        }
    }
    return self;
}
@end

NSString *RandomUUIDString(void) {
    CFUUIDRef uuid = CFUUIDCreate(CFAllocatorGetDefault());
    CFStringRef UUIDCFString = CFUUIDCreateString(CFAllocatorGetDefault(), uuid);
    const char * UUIDCString = CFStringGetCStringPtr(UUIDCFString, kCFStringEncodingUTF8);
    NSString *UUIDString = [NSString stringWithCString:UUIDCString encoding:NSUTF8StringEncoding];
    CFRelease(uuid);
    CFRelease(UUIDCString);
    return UUIDString;
}
