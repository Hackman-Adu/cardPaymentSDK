public struct CardPaymentSDK {

    public static func configureUser(username:String){
        userName = username
    }
    
    private static var userName:String?
    
    public static func printUsername(){
        
        guard let name = userName else {
            print("Please entere a user name")
            return
        }
        print("THIS IS THE USER NAME ENTERED \(name)")
    }
}
