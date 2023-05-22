

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
        viewController?.present(controller, animated: true)
    }
}


public class CardPaymentView:UIViewController, WKScriptMessageHandler{
    
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
       print("THIS IS WHERE CALL BACK WILL BE HANDLED")
    }
    
    
    public var webView:WKWebView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let config = WKWebViewConfiguration()
        config.userContentController.add(self,name: "web_content_hanlder")
        let webview = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), configuration:config)
    }
    
    public override func viewDidLayoutSubviews() {
        self.view.addSubview(webView)
        if let url = URL(string: "https://www.google.com"){
            webView.load(.init(url: url))
        }
    }
}

