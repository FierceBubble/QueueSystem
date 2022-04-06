//
//  StartViewController.swift
//  Queue System
//
//  Created by FierceBubble on 06/04/22.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpElements()
        
    }
    
    func setUpElements() {
        
        Styling.styleFilledButton(signUpButton)
        Styling.styleHollowButton(loginButton)
        
    }


}
