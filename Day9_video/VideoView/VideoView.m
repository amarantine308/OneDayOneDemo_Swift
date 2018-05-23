//
//  VideoView.swift
//  Bolt
//
//  Created by 冯毅潇 on 2018/2/27.
//  Copyright © 2018年 richie. All rights reserved.
//

#import "VideoView.h"

@implementation VideoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addWebView];
    }
    return self;
}


/**
 添加一个webView
 */
- (void)addWebView {
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    
    config.mediaTypesRequiringUserActionForPlayback = WKAudiovisualMediaTypeNone;//把手动播放设置NO
    config.allowsInlineMediaPlayback = YES;//是否允许内联(YES)或使用本机全屏控制器(NO)。默认值是否定的。
    config.allowsAirPlayForMediaPlayback = YES;//允许播放，默认是YES
    
    _wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300) configuration:config];
    _wkWebView.layer.borderWidth = 1;
    _wkWebView.layer.borderColor = [UIColor redColor].CGColor;
    _wkWebView.navigationDelegate = self;
    _wkWebView.UIDelegate = self;
    
    [_wkWebView.scrollView setScrollEnabled:NO];//禁止滚动
    [self addSubview:_wkWebView];
    
    //本地html测试
//    NSString * htmlPath = [NSBundle.mainBundle pathForResource:@"index" ofType:@"html"];
//    NSURL *fileURL = [NSURL fileURLWithPath:htmlPath];
//    [_wkWebView loadFileURL:fileURL allowingReadAccessToURL:fileURL];

    //网页html测试
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://i.gugubaby.com/resources/ad_movietest.php"]];
    
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlPath]];
//    [_wkWebView loadRequest:request];
    
   
}

- (void)loadURL{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlPath]];
    [_wkWebView loadRequest:request];
}

#pragma mark - WKNavigationDelegate
- (void)playVideo{
    NSString *script = @"var videos = document.querySelectorAll(\"video\"); for (var i = videos.length - 1; i >= 0; i--) { var ivideo = videos[i]; ivideo.setAttribute(\"webkit-playsinline\",\"webkit-playsinline\"); ivideo.play(); };";
    [_wkWebView evaluateJavaScript:script completionHandler:nil];
    //video.setAttribute('webkit-playsinline', 'webkit-playsinline');
}
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    NSLog(@"%s", __FUNCTION__);
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"%s", __func__);
    [self playVideo];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    //这里做交互处理
//    NSString *url = [[navigationAction.request URL] absoluteString];
    
    // 允许跳转
    decisionHandler(WKNavigationActionPolicyAllow);
    
}


@end
