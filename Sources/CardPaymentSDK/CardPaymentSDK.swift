


public struct CardPaymentSDK {

    public static func configureUser(cardnumber:String){
        cardNumber = cardnumber
    }
    
    private static var cardNumber:String?
    
    public static func printCardNumber(){
        
        guard let number = cardNumber else {
            print("Please enter card number")
            return
        }
        print("THIS IS THE CARD NUMBER \(number)")
    }
}
