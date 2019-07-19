//
//  PhoneModel.m
//  yiwangqian
//
//  Created by 吴兴 on 2019/2/11.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "PhoneModel.h"
#import "WXTools.h"
#import "DeviceInfo.h"
@implementation PhoneModel


#pragma mark -- 单例
static PhoneModel *sharedInstance = nil;
+ (id)allocWithZone:(NSZone *)zone {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [super allocWithZone:zone];
    [sharedInstance setModel];
  });
  return sharedInstance;
}

+(instancetype)sharePhoneModel
{
  // 最好用self 用Tools他的子类调用时会出现错误
  return  [[self alloc]init];
}
// 为了严谨，也要重写copyWithZone 和 mutableCopyWithZone
-(id)copyWithZone:(NSZone *)zone
{
  return sharedInstance;
}
-(id)mutableCopyWithZone:(NSZone *)zone
{
  return sharedInstance;
}

-(void)setModel{
  self.versionCode =  [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];        //AppBuild
  self.versionName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]; //App版本号
  self.deviceId = [DeviceInfo getUUID];      //设备唯一标识UUID
  self.phoneVersion = [DeviceInfo systemVersion];          //手机系统版本
  self.phoneModel = [DeviceInfo deviceModelName];        //手机型号
  self.phoneBrand = @"iPhone";        //手机厂商
}
@end
