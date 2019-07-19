//
//  WXAlgUserDataManager.m
//  KeyChainTest
//
//  Created by wuxing on 16/6/6.
//  Copyright © 2016年 WX. All rights reserved.
//

#import "WXAlgUserDataManager.h"
#import "WXAlgKeyChain.h"

@implementation WXAlgUserDataManager

static NSString * const KEY_IN_KEYCHAIN = @"com.bjca.tms.keychain";

//自定义key保存  增/改
+(void)saveValue:(id)object forKey:(NSString *)key{
    NSMutableDictionary *dic = [self readKeyDic];
    [dic setObject:object forKey:key];
    [WXAlgKeyChain save:KEY_IN_KEYCHAIN data:dic];
}
//根据某个key读某个值 查
+(id)readKey:(NSString *)key{
    NSMutableDictionary *dic = [self readKeyDic];
    return [dic objectForKey:key];
}

//根据某个key删掉某个值 删
+(void)deleteKey:(NSString *)key{
    NSMutableDictionary *dic = [self readKeyDic];
    [dic removeObjectForKey:key];
    [WXAlgKeyChain save:KEY_IN_KEYCHAIN data:dic];
}

//删除本App在keyChain中存储的所有数据
+(void)deleteKeyChain{
    [WXAlgKeyChain delete:KEY_IN_KEYCHAIN];
}

//读取本app在KeyChain中存储的值
+(id)readKeyDic{
    NSMutableDictionary *usernamepasswordKVPair = (NSMutableDictionary *)[WXAlgKeyChain load:KEY_IN_KEYCHAIN];
    if (!usernamepasswordKVPair) {
        usernamepasswordKVPair = [[NSMutableDictionary alloc]init];
    }
    return usernamepasswordKVPair;
}

@end
