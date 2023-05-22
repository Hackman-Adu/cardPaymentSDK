

import Foundation
import UIKit



public class CardPaymentSDK: PaymentViewDismissed {
    
    
    public func onDismissed(res: PaymentResponse) {
        print("THIS IS THE RESPONSE STATUS \(res.status)")
    }
    
    
    
    private var viewController:UIViewController?
    
    private var paymentViewController:CardPaymentView!
    
    
    public init(vc:UIViewController, paymentViewTitle:String,paymentViewCancelText:String){
        self.viewController = vc
        self.paymentViewController = CardPaymentView()
        self.paymentViewController.paymentViewDismissedProtocol = self
        paymentViewController.paymentViewTitle = paymentViewTitle
        paymentViewController.paymentViewCancelText = paymentViewCancelText
    }
    
    
    
    public func  beginPayment(){
        let navController = UINavigationController(rootViewController: paymentViewController)
        self.viewController?.present(navController, animated: true)
    }
    
}




