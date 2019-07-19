//
//  PhoneModel.h
//  yiwangqian
//
//  Created by 吴兴 on 2019/2/11.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhoneModel : NSObject
@property (nonatomic,copy) NSString *versionCode;        //AppBuild号
@property (nonatomic,copy) NSString *versionName;       //App版本    
//@property (nonatomic,copy) NSString *channelId;     //个推唯一标识
@property (nonatomic,copy) NSString *deviceId;      //设备唯一标识UUID
@property (nonatomic,copy) NSString *phoneVersion;          //手机系统版本
@property (nonatomic,copy) NSString *phoneModel;        //手机型号
@property (nonatomic,copy) NSString *phoneBrand;        //手机厂商
//@property (nonatomic,copy) NSNumber *isHardwareDetected;        //硬件是否支持指纹
//@property (nonatomic,copy) NSNumber *hasEnrolledFingerprints;        //手机当前指纹是否可用

+(instancetype)sharePhoneModel;
@end

NS_ASSUME_NONNULL_END
