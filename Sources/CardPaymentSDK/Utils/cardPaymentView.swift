//
//  File.swift
//  
//
//  Created by Hackman Adu Gyamfi on 15/05/2023.
//

import Foundation
import UIKit
import WebKit


public protocol PaymentResponseDelegate{
    
     func onResponseReceived(res:PaymentResponse)
}

public class CardPaymentView:UIViewController, WKScriptMessageHandler, WKUIDelegate, WKNavigationDelegate{
    
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {

    }
    
    public var paymentViewTitle:String  = "Make Payment"
    
    public var paymentViewCancelText:String  = "Cancel"
    
    private var paymentSDKUrl:String  = "https://checkoutuat.transflowitc.com/?req=eyJmdWxsTmFtZSI6IndpbGxpYW0gbWVuc2FoIiwiZW1haWwiOiJ3aWxsaWFtbWVuc2FoQGdtYWlsLmNvbSIsInBheW1lbnRNZXRob2QiOiJjYXJkIiwibmFycmF0aW9uIjoiVGhpcyBpcyBhIGdlbmVyaWMgcGF5bWVudCBkZXNjcmlwdGlvbiIsImFtb3VudCI6MjAwLCJsb2dvIjoiaHR0cHM6Ly90Zi1tZXJjaGFudHMtdWF0LTQ2MzE0NDI4Mzk1NC5zMy5ldS13ZXN0LTEuYW1hem9uYXdzLmNvbS9sb2dvcy9lZTUwZWU1Yi01MTQyLTQ5NGMtODgwMi0zZGNlZmJlZjlmZjEuanBnIiwicGFnZURlc2NyaXB0aW9uIjoiS251c3QgQ2hlY2tvdXQgUGFnZSIsInBhZ2VUaXRsZSI6IktudXN0IiwiY3VycmVuY3kiOiJHSFMiLCJtc2lzZG4iOiIyMzMyMDE5OTE0MDciLCJ0cmFuc2FjdGlvblJlZmVyZW5jZSI6IjJmZTVjYTIyLWQ2ZDAtNDQzNi1hOGUzLTNmYThjZmVjYjIxNiJ9"
    
    
    public var delegate:PaymentResponseDelegate?
    

    public override func viewDidLoad() {
        super.viewDidLoad()
        title = paymentViewTitle
        self.createWebViewUI()
        self.createNavItems()
        self.setupNavBar()
        self.loadWebViewContent()
    }
    
    public func createWebViewUI(){
        self.view.backgroundColor = .white
        self.view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.topAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            webView.leftAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            webView.bottomAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            webView.rightAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupNavBar()
    }
    
    
    
    public func loadWebViewContent(){
        if let url = URL(string: self.paymentSDKUrl){
            let request = URLRequest(url: url)
            DispatchQueue.main.async {
                self.webView.load(request)
            }
        }
    }
    
    
    public func createNavItems(){
        let dismissButton = UIBarButtonItem(title: paymentViewCancelText, style: .plain, target: self, action: #selector(dismissDialog))
        navigationItem.leftBarButtonItem = dismissButton
    }
    
    @objc public func dismissDialog(){
        dismiss(animated: true) {
            self.delegate?.onResponseReceived(res: PaymentResponse(paymentData: nil, status: .canceled))
        }
       
    }
    
   public func setupNavBar() {
        navigationController?.navigationBar.tintColor = .systemBlue
       navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    public lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.userContentController.add(self,name: "webcontent_handler_name _here")
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    
}
