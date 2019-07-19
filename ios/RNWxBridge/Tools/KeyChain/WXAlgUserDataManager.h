//
//  WXAlgUserDataManager.h
//  KeyChainTest
//
//  Created by wuxing on 16/6/6.
//  Copyright © 2016年 WX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXAlgUserDataManager : NSObject
//自定义key保存  增/改
+(void)saveValue:(id)object forKey:(NSString *)key;
//根据某个key读某个值 查
+(id)readKey:(NSString *)key;
//根据某个key删掉某个值 删
+(void)deleteKey:(NSString *)key;

//删除本App在keyChain中存储的所有数据
+(void)deleteKeyChain;

//读取本app在KeyChain中存储的所有值
+(id)readKeyDic;

@end
