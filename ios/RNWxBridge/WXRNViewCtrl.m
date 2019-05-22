//
//  WXRNViewCtrl.m
//  RNWxBridge
//
//  Created by 吴兴 on 2019/5/18.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "WXRNViewCtrl.h"
#import "WXTools.h"

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

@property (nonatomic, copy) NSDictionary *params;

@end

@implementation WXRNViewCtrl

- (instancetype)initWithModuleName:(NSString *)moduleName fileName:(NSString *)fileName params:(NSDictionary* _Nullable )params{
    self = [super init];
    if(self) {
        self.moduleName = moduleName;
        self.fileName = fileName;
        self.params = params;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:nil];
    RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
                                                     moduleName:self.moduleName
                                              initialProperties:self.params];
    self.view = rootView;
}



- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
    NSURL *url = [WXTools getUrl:self.fileName];
    if (url) {
        return url;
    }else{
        return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
    }
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
