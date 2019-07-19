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
//拷贝包
+ (void)copyPackages;
//寻找寻找包
+ (NSURL *)getUrl:(NSString *)fileName;

/**
 字典转json方法
 
 @param dict 待转换字典
 @return json字符
 */
+ (NSString *)convertToJsonData:(NSDictionary *)dict;


/**
 json转字典
 
 @param jsonString Json串
 @return 字典
 */
+(NSDictionary *)jsonToDic:(NSString *)jsonString;

/**
 对象转字典
 
 @param obj 对象
 @return 字典
 */
+ (NSDictionary*)getObjectData:(id)obj;

/**
 去除特殊符号
 
 @param json 含有特殊字符的String
 @return 结果的String
 */
+(NSString*)removeEscapeCharacter:(NSString*)string;
@end

NS_ASSUME_NONNULL_END
