//
//  VideoView.swift
//  Bolt
//
//  Created by 冯毅潇 on 2018/2/27.
//  Copyright © 2018年 richie. All rights reserved.
//

import UIKit
import WebKit

class VideoView: UIView,WKNavigationDelegate,WKUIDelegate {
    
    public weak var wkWebView:WKWebView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  setUp() {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true//是否允许内联(YES)或使用本机全屏控制器(NO)。默认值是否定的。
        config.allowsAirPlayForMediaPlayback = true//允许播放，默认是YES
        if #available(iOS 10.0, *) {
            config.mediaTypesRequiringUserActionForPlayback = []
        } else {
            config.mediaPlaybackRequiresUserAction = false
        }
        
        wkWebView =  WKWebView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), configuration: config)
        wkWebView.navigationDelegate = self
        wkWebView.uiDelegate = self
        self.addSubview(wkWebView)
        wkWebView.layer.borderWidth = 1
        wkWebView.layer.borderColor =  UIColor.red.cgColor
        wkWebView.scrollView.isScrollEnabled = true
        
        
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
        let fileURL = URL.init(fileURLWithPath: htmlPath!)
        wkWebView.loadFileURL(fileURL, allowingReadAccessTo: fileURL)
        
        
        //        wkWebView.load(URLRequest.init(url: URL.init(string: "http://oss-hz.qianmi.com/x-site/test/d2cStore/A868907/view/adScreen/index/1517908799426.html?t=1")!, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 20))
        //
        //        wkWebView.load(URLRequest.init(url: URL.init(string: "https://img.1000.com/qm-a-img/prod/1877091/004d71231683e1e739966568f8ee710e.mp4")!, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 20))
        //
        
        
        
        
    }
    
    func playVideo(){
        let script = "var videos = document.querySelectorAll(\"video\"); for (var i = videos.length - 1; i >= 0; i--) { var ivideo = videos[i]; ivideo.setAttribute('webkit-playsinline','webkit-playsinline'); ivideo.play(); };"
        wkWebView.evaluateJavaScript(script, completionHandler: nil)
        //video.setAttribute('webkit-playsinline', 'webkit-playsinline');
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        playVideo()
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void){
        decisionHandler(.allow)
    }
}

