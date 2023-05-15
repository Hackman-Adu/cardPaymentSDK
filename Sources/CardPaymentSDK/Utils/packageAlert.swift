//
//  File.swift
//  
//
//  Created by Hackman Adu Gyamfi on 15/05/2023.
//

import Foundation
import UIKit

class PackageAlert{
    
    
    public static func showAlert(viewController:UIViewController, _ title:String, _ message:String){
        var alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        viewController.present(alert, animated: true)
    }
}