//
//  Styling.swift
//  LoginPart
//
//  Created by Steven Wong on 04/04/2022.
//

import Foundation
import UIKit

class Styling{
    
    static func styleTextField(_ textfield:UITextField) {
            
            // Create the bottom line
            let bottomLine = CALayer()
            
            bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 1, width: textfield.frame.width, height: 1)
            
            bottomLine.backgroundColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1).cgColor
            
            // Remove border on text field
            textfield.borderStyle = .none
            
            // Add the line to the text field
            textfield.layer.addSublayer(bottomLine)
            
        }
        
        static func styleFilledButton(_ button:UIButton) {
            
            // Filled rounded corner style
            button.backgroundColor = UIColor.init(red: 0/255, green: 128/255, blue: 255/255, alpha: 1)
            button.layer.cornerRadius = 25.0
            button.tintColor = UIColor.white
        }
        
        static func styleHollowButton(_ button:UIButton) {
            
            // Hollow rounded corner style
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.cornerRadius = 25.0
            button.tintColor = UIColor.black
        }
        
        static func isPasswordValid(_ password : String) -> Bool {
            
            let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.[a-z])(?=.[$@$#!%?&]).{8,}$")
            return passwordTest.evaluate(with: password)
        }
}
