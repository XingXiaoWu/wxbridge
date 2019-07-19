//
//  DeviceInfo.h
//  RNWxBridge
//
//  Created by 无星 on 2019/6/6.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface DeviceInfo : NSObject
/**
 *  获取设备机型
 **/
+ (NSString*)deviceModelName;

/**
 获取设备系统版本

 @return 版本
 */
+ (NSString *)systemVersion;

//获取UUID
+ (NSString *)getUUID;
@end

NS_ASSUME_NONNULL_END
