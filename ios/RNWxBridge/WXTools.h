//
//  WXTools.h
//  RNWxBridge
//
//  Created by 无星 on 2019/5/20.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXTools : NSObject
//拷贝
+ (void)copyPackages;
//寻找
+ (NSURL *)getUrl:(NSString *)fileName;
@end

NS_ASSUME_NONNULL_END
