
#import "RNWxBridge.h"
#import "AppDelegate.h"
#import "WXRNViewCtrl.h"

#import "MBProgressHUD.h"
#import "ZHBPopTipView.h"

@interface RNWxBridge()

@property (nonatomic, strong) MBProgressHUD *hud;

@end


@implementation RNWxBridge

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE(wxnative)
//
//RCT_EXPORT_METHOD(navigate:(NSString*)moduleName fileName:(NSString*)fileName){
//    dispatch_async(dispatch_get_main_queue(), ^{
//        AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//        WXRNViewCtrl *ctrl = [[WXRNViewCtrl alloc]initWithModuleName:moduleName fileName:fileName];
//        [appdelegate.nav pushViewController:ctrl animated:YES];
//    });
//}
//
//
//RCT_EXPORT_METHOD(popViewCtrl){
//    dispatch_async(dispatch_get_main_queue(), ^{
//        AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//        //    RNViewCtrl *ctrl = [[RNViewCtrl alloc]initWithModuleName:moduleName fileName:fileName];
//        [appdelegate.nav popViewControllerAnimated:YES];
//    });
//}

#pragma mark -- loading
//普通loading
RCT_EXPORT_METHOD(showLoading){
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        self.hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    });
}
//
RCT_EXPORT_METHOD(dismissLoading){
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.hud hideAnimated:YES];
    });
}

#pragma mark -- Toast展示
RCT_EXPORT_METHOD(showToast:(NSString*)message){
    dispatch_async(dispatch_get_main_queue(), ^{
        [ZHBPopTipView showText:message position:ZHBPopTipViewPositionCenter duration:2];
    });
}

@end

