//
//  WXHeader.h
//  RNWxBridge
//
//  Created by 无星 on 2019/5/20.
//  Copyright © 2019 Facebook. All rights reserved.
//

#ifndef WXHeader_h
#define WXHeader_h

#define wxDocumentDir    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define wxWebappDirPrefixName @"webapp_work"

//#define wxWebAppDirName [kWebappDirPrefixName stringByAppendingFormat:@"_%@", getAppVersion()]
#define wxWebAppDirPath  [wxDocumentDir stringByAppendingFormat:@"/%@/",wxWebappDirPrefixName]


#endif /* WXHeader_h */
