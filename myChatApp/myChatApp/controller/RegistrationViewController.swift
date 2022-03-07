//
//  RegistrationViewController.swift
//  myChatApp
//
//  Created by Eslam Ali  on 07/03/2022.
//

import UIKit

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
        
        
        
    }
    
    @IBAction func signUpButton(_ sender: Any) {
    }
    @IBAction func setProfilePictureButton(_ sender: Any) {
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
