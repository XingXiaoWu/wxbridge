
#import "RNWxBridge.h"
#import "AppDelegate.h"
#import "WXRNViewCtrl.h"

@interface RNWxBridge()

@end


@implementation RNWxBridge

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE(wxnative)

RCT_EXPORT_METHOD(navigate:(NSString*)moduleName fileName:(NSString*)fileName params:(NSDictionary* _Nullable )params){
    dispatch_async(dispatch_get_main_queue(), ^{
        AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        WXRNViewCtrl *ctrl = [[WXRNViewCtrl alloc]initWithModuleName:moduleName fileName:fileName params:params];
        [appdelegate.nav pushViewController:ctrl animated:YES];
    });
}


RCT_EXPORT_METHOD(popViewCtrl){
    dispatch_async(dispatch_get_main_queue(), ^{
        AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        //    RNViewCtrl *ctrl = [[RNViewCtrl alloc]initWithModuleName:moduleName fileName:fileName];
        [appdelegate.nav popViewControllerAnimated:YES];
    });
}
@end

