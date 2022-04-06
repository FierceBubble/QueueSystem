//
//  LoginViewController.swift
//  iOSassignment
//
//  Created by Gabriella Valencia on 05/04/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    let database = Firestore.firestore()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    func setUpElements() {
        
        errorLabel.alpha = 0
        
        emailTextField.layer.borderWidth = 2
        emailTextField.layer.borderColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1).cgColor
        emailTextField.layer.cornerRadius = 10
        emailTextField.layer.masksToBounds = true
        
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.borderColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1).cgColor
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.masksToBounds = true
        
        Styling.styleFilledButton(loginButton)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    @IBAction func loginClicked(_ sender: Any) {
        
        // TODO: Validate Text Fields
        
        // Create cleaned versions of the text field
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { [self] (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                let userUID = String(result!.user.uid)
                self.database.collection("Users").document(userUID).getDocument { DocumentSnapshot, Error in
                    guard let data = DocumentSnapshot?.data(), Error == nil else{
                        return
                    }
                    
                    guard let role = data["role"] as? String else{
                        return
                    }
                    print("Role: \(role)")
                    
                    if (role == "Student"){
                        // Go to Student Page
                        let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as! ViewController
                        
                        homeViewController.uID = userUID
                        homeViewController.modalPresentationStyle = .fullScreen
                        present(homeViewController, animated: true, completion: nil)

                        
                    }else{
                        // Go to Admin Page
                        let hostViewController = self.storyboard?.instantiateViewController(identifier: Constants.HostStoryboard.hostViewController) as? HostViewController

                        self.view.window?.rootViewController = hostViewController
                        self.view.window?.makeKeyAndVisible()
                        
                    }
                }
                
                
            }
        }
    }
    
}
