//
//  File.swift
//  
//
//  Created by Hackman Adu Gyamfi on 15/05/2023.
//

import Foundation
import UIKit

class PackageAlert{
    
    public var viewController:UIViewController!
    
    public init(vc:UIViewController){
        self.viewController = vc
    }
    
    
    public  func showAlert(_ title:String, _ message:String){
        var alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        self.viewController.present(alert, animated: true)
    }
}
