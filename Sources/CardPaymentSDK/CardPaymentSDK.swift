


public struct CardPaymentSDK {

    public static func configureCard(cardnumber:String, cardholder:String){
        cardNumber = cardnumber
        cardHolder = cardholder
    }
    
    private static var cardNumber:String?
    
    private static var cardHolder:String?
    
    public static func getCardInfo(){
        
        guard let number = cardNumber, let name = cardHolder else {
            print("Please configure card")
            return
        }
        print("THIS IS THE CARD INFORMATION\n Card Number:\(number)\n Card Holder Name:\(name)")
    }
}
