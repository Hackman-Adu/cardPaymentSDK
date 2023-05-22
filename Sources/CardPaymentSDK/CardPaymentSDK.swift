

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
        viewController?.navigationController?.pushViewController(controller, animated: true)
    }
}


public class CardPaymentView:UIViewController, WKScriptMessageHandler, WKUIDelegate{
    
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
      
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.createWebViewUI()
        self.loadWebViewContent()
        self.createNavItems()
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
    
    func setupNavBar() {
        self.navigationController?.navigationBar.barTintColor = .systemBlue
        self.navigationController?.navigationBar.tintColor = .white
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

