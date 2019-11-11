//
//  FGCache.h
//  FGPhoneFunc
//
//  Created by 肥儿古德 on 2019/11/11.
//  Copyright © 2019 hh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FGCache : NSCache

+ (instancetype)sharedInstance;

+ (NSString *)pathWithFileName:(NSString *)fileName;

- (void)setObject:(id)obj forKey:(id)key;
- (id)objectForKey:(id)key;

@end

NS_ASSUME_NONNULL_END
