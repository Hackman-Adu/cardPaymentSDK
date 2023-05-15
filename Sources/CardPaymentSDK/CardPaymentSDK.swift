

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
        
  
        guard let number = cardNumber, let name = cardHolder else {
            print("Please configure card")
            return
        }
        print("THIS IS THE CARD INFORMATION\n Card Number:\(number)\n Card Holder Name:\(name)")
    }
}
