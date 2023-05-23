

import Foundation
import UIKit



public class CardPaymentSDK  {
    
    private var viewController:UIViewController?
    
    private var paymentViewController:CardPaymentView!
    
    public var delegate:PaymentResponseDelegate?
    
    
    public init(vc:UIViewController, paymentViewTitle:String,paymentViewCancelText:String){
        self.viewController = vc
        self.paymentViewController = CardPaymentView()
        paymentViewController.paymentViewTitle = paymentViewTitle
        paymentViewController.paymentViewCancelText = paymentViewCancelText
    }
    
    
    
    public func  beginPayment(){
        paymentViewController.delegate = self.delegate
        let navigationController = viewController?.navigationController
        if navigationController == nil {
            let navController = UINavigationController(rootViewController: paymentViewController)
            self.viewController?.present(navController, animated: true)
        }else {
            self.viewController?.present(paymentViewController, animated: true)
        }
    }
    
}




