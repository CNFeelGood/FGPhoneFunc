//
//  FGDeviceCode.h
//  FGPhoneFunc
//
//  Created by 肥儿古德 on 2019/11/10.
//  Copyright © 2019 hh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FGDeviceCode : NSObject

+ (instancetype)sharedInstance;

- (NSString *)getVender;

@property (nonatomic,copy) NSString * key_udid;
@property (nonatomic,copy) NSString * key_in_keychain;

@end

NS_ASSUME_NONNULL_END
