//
//  NewCardViewController.swift
//  
//
//  Created by Hackman Adu Gyamfi on 22/05/2023.
//

import UIKit
import WebKit

public class NewCardViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var loaderView: UIActivityIndicatorView!
    
    @IBOutlet weak var webView: WKWebView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        self.loadWebContent()
    }
    
    public func loadWebContent(){
        let url = URL(string: "https://www.google.com")!
        let request = URLRequest(url: url)
        self.webView.load(request)
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.loaderView.isHidden = true
    }
    
  public func webView(_ webView: WKWebView, didStartProvisionalNavigation
      navigation: WKNavigation!) {
      self.loaderView.isHidden = false
   }


}
