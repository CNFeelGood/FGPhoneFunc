//
//  FGDeviceCode.m
//  FGPhoneFunc
//
//  Created by 肥儿古德 on 2019/11/10.
//  Copyright © 2019 hh. All rights reserved.
//

#import "FGDeviceCode.h"
#import <Security/Security.h>
#import <UIKit/UIKit.h>

@interface FGDeviceCode ()

@property (nonatomic,copy) NSString * uuid;

@end

@implementation FGDeviceCode

+ (instancetype)sharedInstance{
    static FGDeviceCode * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [FGDeviceCode new];
    });
    return instance;
}
- (NSString *)key_udid{
    if (!_key_udid) {
        _key_udid = @"KEY_UDID_HUANG_GUA_HUANG_DU_DU";
    }
    return _key_udid;
}
- (NSString *)key_in_keychain{
    if (!_key_in_keychain) {
        _key_in_keychain = @"KEY_IN_KEYCHAIN_MHUANG_GUA_HUANG_DU_DU";
    }
    return _key_in_keychain;
}

- (NSString *)getVender{
    NSString * string = [self readUDID];
    NSLog(@"vender----%@",string);
    return string;
}

#pragma mark - 读取uuid
- (id)readUDID{
    if (_uuid == nil || _uuid.length == 0) {
        NSMutableDictionary * udidKVPairs = (NSMutableDictionary *)[self load:self.key_in_keychain];
        NSString *uuid = [udidKVPairs objectForKey:self.key_udid];
        if (uuid == nil || uuid.length == 0) {
            uuid = [self openUDID];
            [self saveUDID:uuid];
        }
        _uuid = uuid;
    }
    return _uuid;
}
#pragma mark 获取uuid
- (NSString *)openUDID{
    NSString * identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];
    return identifierForVendor;
}
#pragma mark 保存uuid到钥匙串
- (void)saveUDID:(NSString *)udid{
    NSMutableDictionary * udidKVPairs = [NSMutableDictionary dictionary];
    [udidKVPairs setObject:udid forKey:self.key_udid];
    [self save:self.key_in_keychain data:udidKVPairs];
}
#pragma mark - 删除uuid
- (void)deleteUUID{
    [self delete:self.key_in_keychain];
}
#pragma mark - 查询钥匙串
- (NSMutableDictionary *)getKeychainQuery:(NSString *)service{
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (__bridge_transfer id)kSecClassGenericPassword,
            (__bridge_transfer id)kSecClass,
            service,(__bridge_transfer id)kSecAttrService,
            service,(__bridge_transfer id)kSecAttrAccount,
            (__bridge_transfer id)kSecAttrAccessibleAfterFirstUnlock,
            (__bridge_transfer id)kSecAttrAccessible, nil];
}
#pragma mark - 将数据保存到钥匙串
- (void)save:(NSString *)service data:(id)data{
    NSMutableDictionary * keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge_transfer id)kSecValueData];
    SecItemAdd((__bridge_retained CFDictionaryRef)keychainQuery, NULL);
}
#pragma mark - 加载钥匙串中的数据
- (id)load:(NSString *)service{
    id ret = nil;
    NSMutableDictionary * keychainQuery = [self getKeychainQuery:service];
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge_transfer id)kSecReturnData];
    [keychainQuery setObject:(__bridge_transfer id)kSecMatchLimitOne forKey:(__bridge_transfer id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((__bridge_retained CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge_transfer NSData *)keyData];
        } @catch (NSException *exception) {
            NSLog(@"Unarchive of %@ failed: %@", service, exception);
        } @finally {
        }
    }
    return ret;
}
#pragma mark - 删除钥匙串中的数据
- (void)delete:(NSString *)service{
    NSMutableDictionary * keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
}

@end
