//
//  ViewController.swift
//  WebviewGetBody
//
//  Created by Bella_Richie on 2017/9/1.
//  Copyright © 2017年 richie. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate, UIScrollViewDelegate {
    public weak var webView: WKWebView!
    
    var urlPath: String!
    
    private var count: Int = 0
    
    required public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public init(urlPath: String) {
        super.init(nibName: nil, bundle: nil)
        self.urlPath = urlPath
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        urlPath = "https://item.jd.com/5025518.html"//"https://item.taobao.com/item.htm?id=523208239120&ali_refid=a3_430582_1006:1121337203:N:%E7%9D%A1%E8%A2%8B%E6%88%B7%E5%A4%96%E7%BE%BD%E7%BB%92:a0dec85f7b3cc9338a6c872391824569&ali_trackid=1_a0dec85f7b3cc9338a6c872391824569&spm=a230r.1.14.11.76bf523ibl8T6#detail"
        
        let webView = WKWebView(frame: view.bounds, configuration: WKWebViewConfiguration())
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.scrollView.delegate = self
        self.view.addSubview(webView)
        self.webView = webView
        
        if let url = URL(string: urlPath) {
            webView.load(URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 20))
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentSize.height <= scrollView.contentOffset.y + webView.frame.height {
            count += 1
            if count == 3 {
                webView.evaluateJavaScript("document.body.innerHTML") { (result, error) in
                    if let res = result as? String {
                        print(res)
                    }
                }
            }
        } else {
            self.webView.scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height), animated: true)
        }
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    open func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.navigationItem.title = webView.title
        
        webView.scrollView.setContentOffset(CGPoint(x: 0, y: 1), animated: true)
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    public func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
            if challenge.previousFailureCount == 0, let serverTrust = challenge.protectionSpace.serverTrust {
                let credential = URLCredential(trust: serverTrust)
                completionHandler(URLSession.AuthChallengeDisposition.useCredential, credential)
            } else {
                completionHandler(URLSession.AuthChallengeDisposition.cancelAuthenticationChallenge, nil)
            }
        } else {
            completionHandler(URLSession.AuthChallengeDisposition.cancelAuthenticationChallenge, nil)
        }
    }
    
    public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        webView.reload()
    }
}



