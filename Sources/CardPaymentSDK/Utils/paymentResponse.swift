//
//  File.swift
//  
//
//  Created by Hackman Adu Gyamfi on 22/05/2023.
//

import Foundation


public enum PaymentStatus{
    
    case processing
    //used when the user dismisses the payment dialog
    case canceled
}

public struct PaymentResponse{
    
    public var paymentData:PaymentData?
    public var status:PaymentStatus?
    
}

public struct PaymentData{
    
    public var amount:String?
    public var transactionDate:String?
}
