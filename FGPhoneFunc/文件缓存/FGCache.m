//
//  FGCache.m
//  FGPhoneFunc
//
//  Created by 肥儿古德 on 2019/11/11.
//  Copyright © 2019 hh. All rights reserved.
//

#import "FGCache.h"

@implementation FGCache

+ (instancetype)sharedInstance{
    static FGCache * cache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [FGCache new];
    });
    return cache;
}
- (void)setObject:(id)obj forKey:(id)key{
    if (obj) {
        key = [self realKeyWithKey:key];
        [super setObject:obj forKey:key];
        [self saveData:obj toFileName:key];
    }
}
- (id)objectForKey:(id)key{
    key = [self realKeyWithKey:key];
    id obj = [super objectForKey:key];
    if (!obj) {
        obj = [self readDataFromFileName:key];
    }
    if (obj) {
        [super setObject:obj forKey:key];
    }
    return obj;
}
#pragma mark - url转码
- (NSString *)realKeyWithKey:(NSString *)key{
    return [key stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
}
#pragma mark - 存取相关
+ (NSString *)pathWithFileName:(NSString *)fileName{
    NSArray * array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [array objectAtIndex:0];
    NSString *documentPath = [documents stringByAppendingPathComponent:fileName];
    return documentPath;
}
- (void)saveData:(NSData *)data toFileName:(NSString *)fileName{
    NSString * documentPath = [[self class] pathWithFileName:fileName];
    [data writeToFile:documentPath atomically:YES];
    NSLog(@"保存的沙盒文件路径:%@",documentPath);
}
- (NSData *)readDataFromFileName:(NSString *)fileName{
    NSString * documentPath = [[self class] pathWithFileName:fileName];
    NSData * data;
    if ([[NSFileManager defaultManager] fileExistsAtPath:documentPath]) {
        data = [[NSData alloc] initWithContentsOfFile:documentPath];
    }
    return data;
}

@end
