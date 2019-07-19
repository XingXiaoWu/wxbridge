//
//  WQKeyChain.h
//  KeyChainTest
//
//  Created by wuxing on 16/6/6.
//  Copyright © 2016年 WX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXAlgKeyChain : NSObject

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service;

+ (void)save:(NSString *)service data:(id)data;

+ (id)load:(NSString *)service;

+ (void)delete:(NSString *)service;
@end
