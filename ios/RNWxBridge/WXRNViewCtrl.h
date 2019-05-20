//
//  WXRNViewCtrl.h
//  RNWxBridge
//
//  Created by 吴兴 on 2019/5/18.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

#if __has_include("RCTBridgeDelegate.h")
#import "RCTBridgeDelegate.h"
//0.0.4
#else
#import <React/RCTBridgeDelegate.h>
#endif



NS_ASSUME_NONNULL_BEGIN

@interface WXRNViewCtrl : UIViewController<RCTBridgeDelegate>
- (instancetype)initWithModuleName:(NSString *)moduleName fileName:(NSString *)fileName;
@end

NS_ASSUME_NONNULL_END
