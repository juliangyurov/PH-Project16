//
//  WikiWebViewController.swift
//  Project16
//
//  Created by Yulian Gyuroff on 29.10.23.
//
import WebKit
import UIKit

class WikiWebViewController: UIViewController,WKNavigationDelegate {
    var webView: WKWebView!
    var url: URL!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        performSelector(inBackground: #selector(loadWebView), with: nil)
        //webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    @objc func loadWebView() {
        webView.load(URLRequest(url: url))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
