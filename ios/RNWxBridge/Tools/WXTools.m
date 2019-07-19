//
//  WXTools.m
//  RNWxBridge
//
//  Created by 无星 on 2019/5/20.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "WXTools.h"
#import "WXHeader.h"

//使用runtime,对象转字典
#import <sys/utsname.h>
#import <objc/runtime.h>
@implementation WXTools
+ (void)copyPackages {
    NSLog(@"webapp dir=%@",wxWebAppDirPath);
    NSString *bundleDir = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"webapp"];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSError *error = NULL;
    if (![fm fileExistsAtPath:wxWebAppDirPath]) {
        [fm createDirectoryAtPath:wxWebAppDirPath withIntermediateDirectories:YES attributes:NULL error:&error];
    }
    if (error == NULL) {
        NSArray *items = [fm contentsOfDirectoryAtPath:bundleDir error:&error];
        for (NSString *item in items) {
            NSString *fromFullPath = [bundleDir stringByAppendingPathComponent:item];
            NSString *destFullPath = [wxWebAppDirPath stringByAppendingPathComponent:item];
            if ([fm fileExistsAtPath:destFullPath]) {
                [fm removeItemAtPath:destFullPath error:&error];
            }
            if (error == NULL) {
                [fm copyItemAtPath:fromFullPath toPath:destFullPath error:&error];
            }
            if (error) {
                break;
            }
        }
    }
    if(error != NULL) {
        NSLog(@"Copy Packages失败-%@",error.localizedDescription);
    } else {
        NSLog(@"Copy Packages完成！");
    }
}

+(NSURL *)getUrl:(NSString *)fileName{
    NSArray* fileArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:wxWebAppDirPath error:nil];

    NSURL *result;
    
    for (NSString* file in fileArray) {
        if ([file isEqualToString:fileName]) {
            NSString *bundlFilePath = [wxWebAppDirPath stringByAppendingFormat:@"%@/%@.jsbundle",fileName,fileName];
            result = [NSURL URLWithString:bundlFilePath];
            break;
        }
    }

    return result;
}



#pragma mark - 字典转json
+ (NSString *)convertToJsonData:(NSDictionary *)dict{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
}

#pragma mark -- JSON转字典
+(NSDictionary *)jsonToDic:(NSString *)jsonString {
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingAllowFragments
                                                      error:&error];
    if (jsonObject != nil && error == nil){
        return jsonObject;
    }else{
        // 解析错误
        return nil;
    }
}
#pragma mark - 对象转字典(一)
+ (NSDictionary*)getObjectData:(id)obj{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    unsigned int propsCount;
    
    objc_property_t *props = class_copyPropertyList([obj class], &propsCount);
    
    for(int i = 0;i < propsCount; i++)
        
    {
        objc_property_t prop = props[i];
        
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
        
        id value = [obj valueForKey:propName];
        
        if(value == nil)
        {
            value = [NSNull null];
        }
        else
        {
            value = [self getObjectInternal:value];
        }
        [dic setObject:value forKey:propName];
    }
    
    return dic;
    
}

#pragma mark  对象转字典(二)
+ (id)getObjectInternal:(id)obj{
    
    if([obj isKindOfClass:[NSString class]] || [obj isKindOfClass:[NSNumber class]] || [obj isKindOfClass:[NSNull class]])
    {
        return obj;
    }
    if([obj isKindOfClass:[NSArray class]])
    {
        NSArray *objarr = obj;
        
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:objarr.count];
        
        for(int i = 0;i < objarr.count; i++)
        {
            [arr setObject:[self getObjectInternal:[objarr objectAtIndex:i]] atIndexedSubscript:i];
        }
        return arr;
    }
    if([obj isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *objdic = obj;
        
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[objdic count]];
        
        for (NSString *key in objdic.allKeys) {
            
            [dic setObject:[self getObjectInternal:[objdic objectForKey:key]] forKey:key];
            
        }
        return dic;
    }
    return [self getObjectData:obj];
}

#pragma mark -- 去除RN存储数据解析后的字符串含有 " 和 转义符
+(NSString*)removeEscapeCharacter:(NSString*)string{
    //  首先自己定义一个NSCharacterSet, 包含需要去除的特殊符号
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"@：；（）¥「」＂、[]{}#%-*+=_\\|~＜＞$€^•'@#$%^&*()_+'\""];
    
    NSString *responseString = [string stringByTrimmingCharactersInSet:set];
    
    return responseString;
}

//- (void)getBundlesList{
//    self.rnBundles = [NSMutableArray array];
//    self.crnBundles = [NSMutableArray array];
//    NSArray* fileArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:wxWebAppDirPath error:nil];
//    for (NSString* fileName in fileArray) {
//        NSString *unBundlFilePath = [[wxWebAppDirPath stringByAppendingString:fileName] stringByAppendingPathComponent:@"_crn_unbundle"];
//        if (access([unBundlFilePath UTF8String], 0) == 0) {
//            [self.crnBundles addObject:fileName];
//        }else if (![fileName isEqualToString:@"rn_common"]){
//            [self.rnBundles addObject:fileName];
//        }
//    }
//    if (self.rnBundles.count > 0) {
//        self.selectedRNBundle = [self.rnBundles firstObject];
//    }
//    if (self.crnBundles.count > 0) {
//        self.selectedCRNBundle = [self.crnBundles firstObject];
//    }
//}

/*
+(NSURL *)getBundlePath{
    NSURL *jsCodeLocation;
#ifdef DEBUG
    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];
    return jsCodeLocation;
#else
    //jsbundle地址
    NSString *jsDocumentsPath = [NSString stringWithFormat:@"%@/\%@",NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0],@"main.jsbundle"];
    //assets文件夹地址
    //    NSString *assetsCachePath = [NSString stringWithFormat:@"%@/\%@",NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0],@"assets"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:jsDocumentsPath]) {
        return [NSURL URLWithString:jsDocumentsPath];
    } else {
        jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
        return jsCodeLocation;
    }
#endif
}*/

//
////拷贝打包产物到工作目录
//- (void)copyPackages {
//    NSLog(@"webapp dir=%@",kWebAppDirPath);
//    NSString *bundleDir = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"webapp"];
//    NSFileManager *fm = [NSFileManager defaultManager];
//    NSError *error = NULL;
//    if (![fm fileExistsAtPath:kWebAppDirPath]) {
//        [fm createDirectoryAtPath:kWebAppDirPath withIntermediateDirectories:YES attributes:NULL error:&error];
//    }
//    if (error == NULL) {
//        NSArray *items = [fm contentsOfDirectoryAtPath:bundleDir error:&error];
//        for (NSString *item in items) {
//            NSString *fromFullPath = [bundleDir stringByAppendingPathComponent:item];
//            NSString *destFullPath = [kWebAppDirPath stringByAppendingPathComponent:item];
//            if ([fm fileExistsAtPath:destFullPath]) {
//                [fm removeItemAtPath:destFullPath error:&error];
//            }
//            if (error == NULL) {
//                [fm copyItemAtPath:fromFullPath toPath:destFullPath error:&error];
//            }
//            if (error) {
//                break;
//            }
//        }
//    }
//    if(error != NULL) {
//        NSLog(@"Copy Packages失败-%@",error.localizedDescription);
//    } else {
//        NSLog(@"Copy Packages完成！");
//    }
//}

@end
