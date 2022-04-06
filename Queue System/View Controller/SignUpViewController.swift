//
//  SignUpViewController.swift
//  iOSassignment
//
//  Created by Gabriella Valencia on 05/04/22.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var fNameTextField: UITextField!
    
    @IBOutlet weak var studentIDTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    

    func setUpElements() {
        
        errorLabel.alpha = 0
        
        //styling the border
        fNameTextField.layer.borderWidth = 2
        fNameTextField.layer.borderColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1).cgColor
        fNameTextField.layer.cornerRadius = 10
        fNameTextField.layer.masksToBounds = true
        
        studentIDTextField.layer.borderWidth = 2
        studentIDTextField.layer.borderColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1).cgColor
        studentIDTextField.layer.cornerRadius = 10
        studentIDTextField.layer.masksToBounds = true
        
        emailTextField.layer.borderWidth = 2
        emailTextField.layer.borderColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1).cgColor
        emailTextField.layer.cornerRadius = 10
        emailTextField.layer.masksToBounds = true
        
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.borderColor = UIColor.init(red: 30/255, green: 144/255, blue: 255/255, alpha: 1).cgColor
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.masksToBounds = true
        
        Styling.styleFilledButton(signUpButton)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if fNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            studentIDTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        
        return nil
    }

    
    @IBAction func signUpClicked(_ sender: Any) {
        
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            promptError(error!)
        }
        else {
            
            // Create cleaned versions of the data
            let fullName = fNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let studentID = studentIDTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let role = "Student"
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    self.promptError("Error creating user")
                }
                else {
                    
                    // User was created successfully, now store the full name and studentID
                    let db = Firestore.firestore()
                    
                    db.collection("Users").document(String(result!.user.uid)).setData(["name":fullName, "studentID":studentID,"email":email,"password":password, "role":role ]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            self.promptError("Error saving user data")
                        }
                    }
                    
                    // Transition to the home screen
                    self.movingToHome()
                }
                
            }
            
            
            
        }
    }
    
    func promptError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func movingToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? ViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
    
}
