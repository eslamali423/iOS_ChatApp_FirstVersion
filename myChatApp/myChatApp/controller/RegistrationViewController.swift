//
//  RegistrationViewController.swift
//  myChatApp
//
//  Created by Eslam Ali  on 07/03/2022.
//

import UIKit
import ProgressHUD

class RegistrationViewController: UIViewController {

    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordFiled: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Create new user"
        
        firstnameLabel.text = ""
        lastnameLabel.text = ""
        emailLabel.text = ""
        passwordLabel.text = ""
        confirmPasswordLabel.text = ""
        
        firstNameField.delegate = self
        lastNameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        confirmPasswordFiled.delegate = self
        
hideKeyboardWhenEndEditing()
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        if let fname = firstNameField.text, !fname.isEmpty,
           let lname = lastNameField.text, !lname.isEmpty,
           let email = emailField.text, !email.isEmpty,
           let password = passwordField.text, !password.isEmpty,
           let cpassword = confirmPasswordFiled.text, !cpassword.isEmpty,
           password == cpassword{
            // success to get full data
            print("ready to sign up")
        } else  {
            ProgressHUD.showError("Please fill all requied data")
        }
        
    }
    @IBAction func setProfilePictureButton(_ sender: Any) {
    }
    
    
    //MARK:- to hide the keyboard when end Editing
  private  func hideKeyboardWhenEndEditing (){
    let gesture =  UITapGestureRecognizer(target: self, action: #selector(hidekeyboard))
    view.addGestureRecognizer(gesture)
   }
    
    @objc func hidekeyboard (){
        view.endEditing(false)
    }
    
}

extension RegistrationViewController : UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        firstnameLabel.text = firstNameField.hasText ? "First Name" : ""
        lastnameLabel.text = lastNameField.hasText ? "Last Name" : ""
        emailLabel.text = emailField.hasText ? "Email" : ""
        passwordLabel.text = passwordField.hasText ? "Password" : ""
        confirmPasswordLabel.text = confirmPasswordFiled.hasText ? "Confirm Password" : ""

    }
    
}