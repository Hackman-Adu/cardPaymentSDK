

import Foundation
import UIKit
import WebKit


public class CardPaymentSDK {
    
    
    private var viewController:UIViewController?
    
    private var paymentViewController:CardPaymentView!
    
    
    public init(vc:UIViewController, paymentViewTitle:String,paymentViewCancelText:String){
        self.viewController = vc
        self.paymentViewController = CardPaymentView()
        paymentViewController.paymentViewTitle = paymentViewTitle
        paymentViewController.paymentViewCancelText = paymentViewCancelText
    }
    
    
    
    public func  beginPayment(){
        let navController = UINavigationController(rootViewController: paymentViewController)
        self.viewController?.present(navController, animated: true)
    }
    
}


public class CardPaymentView:UIViewController, WKScriptMessageHandler, WKUIDelegate, WKNavigationDelegate{
    
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
      
    }
    
    public var paymentViewTitle:String  = "Make Payment"
    
    public var paymentViewCancelText:String  = "Cancel"
    
    private var paymentSDKUrl:String  = "https://www.facebook.com"
    

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
                .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 45),
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
            self.webView.load(request)
        }
    }
    
    public func createNavItems(){
        let dismissButton = UIBarButtonItem(title: paymentViewCancelText, style: .plain, target: self, action: #selector(dismissDialog))
        navigationItem.leftBarButtonItem = dismissButton
    }
    
    @objc public func dismissDialog(){
        dismiss(animated: true)
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

