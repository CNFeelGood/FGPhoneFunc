//
//  FGPhoneStyle.m
//  FGPhoneFunc
//
//  Created by 肥儿古德 on 2019/11/10.
//  Copyright © 2019 hh. All rights reserved.
//

#import "FGPhoneStyle.h"
#import <sys/utsname.h>

@implementation FGPhoneStyle

+ (NSString *)phoneStyle{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    // iPhone
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone_3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone_3GS";
    if ([platform isEqualToString:@"iPhone3,1"])     return @"iPhone_4";
    if ([platform isEqualToString:@"iPhone3,2"])    return @"Verizon_iPhone_4";
    if ([platform isEqualToString:@"iPhone3,3"])     return @"iPhone_4";
    if ([platform isEqualToString:@"iPhone4,1"])     return @"iPhone_4S";
    // iPhone_5 | iPhone_5S |  iPhone_5c
    if ([platform isEqualToString:@"iPhone5,1"])     return @"iPhone_5";
    if ([platform isEqualToString:@"iPhone5,2"])     return @"iPhone_5";
    if ([platform isEqualToString:@"iPhone5,3"])     return @"iPhone_5c";
    if ([platform isEqualToString:@"iPhone5,4"])     return @"iPhone_5c";
    if ([platform isEqualToString:@"iPhone6,1"])     return @"iPhone_5S";
    if ([platform isEqualToString:@"iPhone6,2"])     return @"iPhone_5S";
    // iPhone_6 | iPhone_6P | iPhone_6S | iPhone_6SP
    if ([platform isEqualToString:@"iPhone7,2"])     return @"iPhone_6";
    if ([platform isEqualToString:@"iPhone7,1"])     return @"iPhone_6_Plus";
    if ([platform isEqualToString:@"iPhone8,1"])     return @"iPhone_6S";
    if ([platform isEqualToString:@"iPhone8,2"])     return @"iPhone_6S_Plus";
    // iPhone_SE
    if ([platform isEqualToString:@"iPhone8,3"])     return @"iPhone_SE";
    if ([platform isEqualToString:@"iPhone8,4"])     return @"iPhone_SE";
    // iPhone_7 | iPhone_7P
    if ([platform isEqualToString:@"iPhone9,1"])     return @"iPhone_7";
    if ([platform isEqualToString:@"iPhone9,2"])     return @"iPhone_7_Plus";
    if ([platform isEqualToString:@"iPhone9,3"])     return @"iPhone_7";
    if ([platform isEqualToString:@"iPhone9,4"])    return @"iPhone_7_Plus";
    // iPhone_8 | iPhone_8P
    if ([platform isEqualToString:@"iPhone10,1"])   return @"iPhone_8";
    if ([platform isEqualToString:@"iPhone10,4"])   return @"iPhone_8";
    if ([platform isEqualToString:@"iPhone10,2"])   return @"iPhone_8_Plus";
    if ([platform isEqualToString:@"iPhone10,5"])   return @"iPhone_8_Plus";
    // iPhone_X
    if ([platform isEqualToString:@"iPhone10,3"])   return @"iPhone_X";
    if ([platform isEqualToString:@"iPhone10,6"])     return @"iPhone_X";
    // iPhone_XR | iPhone_XS | iPhone_XS_Max
    if ([platform isEqualToString:@"iPhone11,8"])     return @"iPhone_XR";
    if ([platform isEqualToString:@"iPhone11,2"])     return @"iPhone_XS";
    if ([platform isEqualToString:@"iPhone11,4"])     return @"iPhone_XS_Max_China";
    if ([platform isEqualToString:@"iPhone11,6"])     return @"iPhone_XS_Max";
    // iPhone 11 | iPhone 11 Pro | iPhone 11 Pro Max
    if ([platform isEqualToString:@"iPhone12,1"])     return @"iPhone_11";
    if ([platform isEqualToString:@"iPhone12,3"])     return @"iPhone_11_Pro";
    if ([platform isEqualToString:@"iPhone12,5"])     return @"iPhone_11_Pro_Max";
    // .....
    // iPod Touch
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod_Touch";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod_Touch_2";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod_Touch_3";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod_Touch_4";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod_Touch_5";
    if ([platform isEqualToString:@"iPod7,1"])   return @"iPod_Touch_6";
    // iPad
    if ([platform isEqualToString:@"iPad1,1"])  return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])  return @"iPad_2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])  return @"iPad_2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])  return @"iPad_2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])  return @"iPad_2";
    if ([platform isEqualToString:@"iPad3,1"])  return @"iPad_3";
    if ([platform isEqualToString:@"iPad3,2"])  return @"iPad_3";
    if ([platform isEqualToString:@"iPad3,3"])  return @"iPad_3";
    if ([platform isEqualToString:@"iPad3,4"])  return @"iPad_4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])  return @"iPad_4";
    if ([platform isEqualToString:@"iPad3,6"])  return @"iPad_4";
    if ([platform isEqualToString:@"iPad6,11"]) return @"iPad_5";
    if ([platform isEqualToString:@"iPad6,12"]) return @"iPad_5";
    if ([platform isEqualToString:@"iPad7,5"])  return @"iPad_6";
    if ([platform isEqualToString:@"iPad7,6"])  return @"iPad_6";
    // iPad_Air
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad_Air";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad_Air";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad_Air";
    if ([platform isEqualToString:@"iPad5,3"])   return @"iPad_Air_2";
    if ([platform isEqualToString:@"iPad5,4"])   return @"iPad_Air_2";
    // iPad_mini
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad_mini";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad_mini";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad_mini";
    // iPad_mini 2
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad_mini_2";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad_mini_2";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad_mini_2";
    // iPad_mini 3
    if ([platform isEqualToString:@"iPad4,7"])   return @"iPad_mini_3";
    if ([platform isEqualToString:@"iPad4,8"])   return @"iPad_mini_3";
    if ([platform isEqualToString:@"iPad4,9"])   return @"iPad_mini_3";
    // iPad_mini 4
    if ([platform isEqualToString:@"iPad5,1"])   return @"iPad_mini_4";
    if ([platform isEqualToString:@"iPad5,2"])   return @"iPad_mini_4";
    // iPad_Pro(9.7)
    if ([platform isEqualToString:@"iPad6,3"])   return @"iPad_Pro(9.7)";
    if ([platform isEqualToString:@"iPad6,4"])   return @"iPad_Pro(9.7)";
    // iPad_Pro(10.5)
    if ([platform isEqualToString:@"iPad7,3"])   return @"iPad_Pro(10.5)";
    if ([platform isEqualToString:@"iPad7,4"])   return @"iPad_Pro(10.5)";
    // iPad_Pro(11)
    if ([platform isEqualToString:@"iPad8,1"])   return @"iPad_Pro(11)";
    if ([platform isEqualToString:@"iPad8,2"])   return @"iPad_Pro(11)";
    if ([platform isEqualToString:@"iPad8,3"])   return @"iPad_Pro(11)";
    if ([platform isEqualToString:@"iPad8,4"])   return @"iPad_Pro(11)";
    // iPad_Pro(12.9)
    if ([platform isEqualToString:@"iPad6,7"])   return @"iPad_Pro(12.9)";
    if ([platform isEqualToString:@"iPad6,8"])   return @"iPad_Pro(12.9)";
    // iPad_Pro_2(12.9)
    if ([platform isEqualToString:@"iPad7,1"])   return @"iPad_Pro_2(12.9)";
    if ([platform isEqualToString:@"iPad7,2"])   return @"iPad_Pro_2(12.9)";
    // iPad_Pro_3(12.9)
    if ([platform isEqualToString:@"iPad8,5"])   return @"iPad_Pro_3(12.9)";
    if ([platform isEqualToString:@"iPad8,6"])   return @"iPad_Pro_3(12.9)";
    if ([platform isEqualToString:@"iPad8,7"])   return @"iPad_Pro_3(12.9)";
    if ([platform isEqualToString:@"iPad8,8"])   return @"iPad_Pro_3(12.9)";
    // 模拟器
    if ([platform isEqualToString:@"i386"])         return @"Simulator_i386";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator_x86_64";
    
    return @"19年后的新机型";
}

@end
