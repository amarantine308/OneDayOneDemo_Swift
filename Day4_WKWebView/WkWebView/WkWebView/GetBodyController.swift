//
//  GetBodyController.swift
//  Bolt
//
//  Created by 冯毅潇 on 2017/9/18.
//  Copyright © 2017年 richie. All rights reserved.
//

import UIKit
import WebKit

public protocol GetBodyDelegate: NSObjectProtocol{
    
    func didGetBody(_ body:String)
}
class GetBodyController: UIViewController,WKUIDelegate, WKNavigationDelegate, UIScrollViewDelegate {
    
    open var getBodyDelegate:GetBodyDelegate?
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

    override func viewDidLoad() {
        super.viewDidLoad()
        initWeb()
    }
    
    func initWeb() {
        
        let webView = WKWebView(frame: view.bounds, configuration: WKWebViewConfiguration())
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.scrollView.delegate = self
        //webView.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        self.view.addSubview(webView)
        self.webView = webView
        
        if let url = URL(string: urlPath) {
            webView.load(URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 20))
        }
    }
// MARK:- ScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentSize.height <= scrollView.contentOffset.y + webView.frame.height {
            count += 1
            if count == 3 {
                webView.evaluateJavaScript("document.body.innerHTML") { (result, error) in
                    if let res = result as? String {
                        //print(res)
                        if let getBodyDelegate = self.getBodyDelegate {
                          getBodyDelegate.didGetBody(res)
                        }
                    }
                }
            }
        } else {
            self.webView.scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height), animated: true)
        }
    }
// MARK:- web
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
