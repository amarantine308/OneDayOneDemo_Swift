//
//  VideoView.swift
//  Bolt
//
//  Created by 冯毅潇 on 2018/2/27.
//  Copyright © 2018年 richie. All rights reserved.
//

#import <WebKit/WebKit.h>
#import <UIKit/UIKit.h>

#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width

@interface VideoView : UIView<WKNavigationDelegate,UIWebViewDelegate,WKUIDelegate>

@property (nonatomic, strong) WKWebView *wkWebView;
@property (nonatomic, copy) NSString *urlPath;

- (void)loadURL;
@end
