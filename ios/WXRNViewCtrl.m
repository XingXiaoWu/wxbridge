//
//  WXRNViewCtrl.m
//  RNWxBridge
//
//  Created by 吴兴 on 2019/5/18.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "WXRNViewCtrl.h"


#if __has_include("RCTBridge.h")
#import "RCTBridge.h"
#import "RCTBundleURLProvider.h"
#import "RCTRootView.h"
#else
#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#endif


@interface WXRNViewCtrl ()
@property (nonatomic, copy) NSString *moduleName;

@property (nonatomic, copy) NSString *fileName;

@end

@implementation WXRNViewCtrl

- (instancetype)initWithModuleName:(NSString *)moduleName fileName:(NSString *)fileName{
    self = [super init];
    if(self) {
        self.moduleName = moduleName;
        self.fileName = fileName;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:nil];
    RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
                                                     moduleName:self.moduleName
                                              initialProperties:nil];
    self.view = rootView;
}



- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.fileName withExtension:@"jsbundle"];
    if (url) {
        return url;
    }else{
        return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
    }
    //
    //#if DEBUG
    //  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:self.moduleName fallbackResource:nil];
    //#else
    //  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
    //#endif
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
