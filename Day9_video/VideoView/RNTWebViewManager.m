//
//  RNTWebViewManager.m
//  Bolt
//
//  Created by 冯毅潇 on 2018/2/27.
//  Copyright © 2018年 richie. All rights reserved.
//

#import "RNTWebViewManager.h"
#import "VideoView.h"
@implementation RNTWebViewManager

RCT_EXPORT_MODULE()
RCT_EXPORT_VIEW_PROPERTY(urlPath,NSString)


- (UIView *)view
{
    VideoView *v = [[VideoView alloc] init];
    //v.urlPath =
    //[v loadURL];
    return v;
}
@end
