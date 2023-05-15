

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
        guard let number = cardNumber, let name = cardHolder else {
            PackageAlert.showAlert(viewController: vc, "Card Payment", "Please enter card number and card holder name")
            return
        }
        var message = "THIS IS THE CARD INFORMATION\n Card Number: \(number)\n Card Holder Name: \(name)"
        PackageAlert.showAlert(viewController: vc, "Card Information", message)
    }
}
