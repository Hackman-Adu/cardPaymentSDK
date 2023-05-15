


public struct CardPaymentSDK {

    public static func configureCard(cardnumber:String, cardholder:String){
        cardNumber = cardnumber
        cardHolder = cardholder
    }
    
    private static var cardNumber:String?
    
    private static var cardHolder:String?
    
    public static func getCardInfo(){
        
        guard let number = cardNumber else {
            print("Please enter card number")
            return
        }
        guard let name = cardHolder else {
            print("Please enter card holder name")
            return
        }
        print("THIS IS THE CARD INFORMATION/n Card Number:\(number)/n Card Holder Name:\(name)")
    }
}
