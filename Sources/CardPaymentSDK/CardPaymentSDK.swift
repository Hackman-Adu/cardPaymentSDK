

import Foundation
import UIKit



public class CardPaymentSDK  {
    
    private var viewController:UIViewController?
    
    private var paymentViewController:CardPaymentView!
    
    public var delegate:PaymentViewDismissed?
    
    
    public init(vc:UIViewController, paymentViewTitle:String,paymentViewCancelText:String){
        self.viewController = vc
        self.paymentViewController = CardPaymentView()
        paymentViewController.paymentViewTitle = paymentViewTitle
        paymentViewController.delegate = self.delegate
        paymentViewController.paymentViewCancelText = paymentViewCancelText
    }
    
    
    
    public func  beginPayment(){
        let navController = UINavigationController(rootViewController: paymentViewController)
        self.viewController?.present(navController, animated: true)
    }
    
}




