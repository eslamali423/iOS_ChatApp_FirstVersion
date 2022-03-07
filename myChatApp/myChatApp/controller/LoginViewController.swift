//
//  LoginViewController.swift
//  myChatApp
//
//  Created by Eslam Ali  on 07/03/2022.
//

import UIKit
import ProgressHUD



class LoginViewController: UIViewController {
    //MARK:- outlets

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        title = "Login"
        
        emailLabel.text = ""
        passwordLabel.text = ""
        
        emailField.delegate = self
        passwordField.delegate = self
        
        

    }

    
    @IBAction func loginButton(_ sender: Any) {
        // validation
        if let email = emailField.text, !email.isEmpty,
           let password =  passwordField.text, !password.isEmpty {
            // go to login function
            print("ready to login ")
        }else {
            ProgressHUD.showError("Please fill the Email and password correctly")
        }
    
        
        
        
    }
 
    @IBAction func registrationButton(_ sender: Any) {
        let registrationVC = storyboard?.instantiateViewController(identifier: "RegistrationViewController") as! RegistrationViewController
        registrationVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(registrationVC, animated: true)
      //  present(registrationVC, animated: true, completion: nil)
        
    }
}

extension LoginViewController : UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        emailLabel.text = emailField.hasText ? "Email" : ""
        passwordLabel.text = passwordField.hasText ? "Password" : ""
    }
}
