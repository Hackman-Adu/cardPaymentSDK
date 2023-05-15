

import Foundation
import UIKit


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
            alert.showAlert("Card Payment", "Please enter card number and card holder name")
            return
        }
        let message = "Card Number: \(number)\n Card Holder Name: \(name)"
        alert.showAlert("Card Information", message)
    }
}
