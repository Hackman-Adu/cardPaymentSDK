

import Foundation
import UIKit
import WebKit


public struct CardPaymentSDK {
    
    public static func configureCard(cardnumber:String, cardholder:String,viewcontroller:UIViewController){
        cardNumber = cardnumber
        cardHolder = cardholder
        viewController = viewcontroller
        
    }
    
    private static var cardNumber:String?
    
    private static var viewController:UIViewController?
    
    private static var cardHolder:String?
    
    public static func getCardInfo(){
        guard let vc = viewController else { return }
        var alert = PackageAlert(vc: vc)
        guard let number = cardNumber, let name = cardHolder else {
            alert.showAlert("Card Payment", "Please enter your card number and card holder name")
            return
        }
        let message = "Card Number: \(number)\n Card Holder Name: \(name)"
        alert.showAlert("Card Information", message)
    }
    
    public static func showCardPaymentView(){
        var controller = CardPaymentView()
        var navController = UINavigationController(rootViewController: controller)
//        navController.modalPresentationStyle = .fullScreen
        viewController.present(navController, animated: true)
    }
}


public class CardPaymentView:UIViewController, WKScriptMessageHandler, WKUIDelegate, WKNavigationDelegate{
    
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
      
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("HIDE LOADING HERE IF LOADER WAS SHOWN IN THE FIRST PLACE")
    }

    
    public override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Card Payment SDK"
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
                .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 50),
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
        if let url = URL(string: "https://www.facebook.com"){
            var request = URLRequest(url: url)
            self.webView.load(request)
        }
    }
    
    public func createNavItems(){
        let dismissButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissDialog))
        navigationItem.leftBarButtonItem = dismissButton
    }
    
    @objc public func dismissDialog(){
        dismiss(animated: true)
    }
    
   public func setupNavBar() {
        navigationController?.navigationBar.barTintColor = .systemBlue
        navigationController?.navigationBar.tintColor = .white
       navigationController?.title = "Card Payment SDK"
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

