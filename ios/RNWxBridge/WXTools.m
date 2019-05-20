//
//  WXTools.m
//  RNWxBridge
//
//  Created by 无星 on 2019/5/20.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "WXTools.h"
#import "WXHeader.h"
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
