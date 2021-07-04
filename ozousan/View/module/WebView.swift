//
//  WebView.swift
//  SwiftUI Architecture
//
//  WebView(urlString: 表示したいwebのURL)
//  Created by 宮本光直 on 2021/06/25.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var urlString: String
    
    class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        // "target="_blank""が設定されたリンクも開けるようにする
        func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
            if navigationAction.targetFrame == nil {
                webView.load(navigationAction.request)
            }
            return nil
        }
        
        // URLごとに処理を制御する
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
            if let url = navigationAction.request.url?.absoluteString {
                if (url.hasPrefix("https://apps.apple.com/")) {
                    guard let appStoreLink = URL(string: url) else {
                        return
                    }
                    UIApplication.shared.open(appStoreLink, options: [:], completionHandler: { (succes) in
                    })
                    decisionHandler(WKNavigationActionPolicy.cancel)
                } else if (url.hasPrefix("http")) {
                    decisionHandler(WKNavigationActionPolicy.allow)
                } else {
                    decisionHandler(WKNavigationActionPolicy.cancel)
                }
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        // makeCoordinatorで生成したCoordinatorクラスのインスタンスを指定
        webView.uiDelegate = context.coordinator
        webView.navigationDelegate = context.coordinator
        
        // スワイプで画面遷移できるようにする
        webView.allowsBackForwardNavigationGestures = true
        
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
