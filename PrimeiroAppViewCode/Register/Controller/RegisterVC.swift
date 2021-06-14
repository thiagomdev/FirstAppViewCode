//
//  RegisterVC.swift
//  PrimeiroAppViewCode
//
//  Created by Thiago Monteiro  on 16/04/21.
//

import UIKit

class RegisterVC: UIViewController {
    
    var registerScreen: RegisterScreen?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.registerScreen?.delegate(delegate: self)
        self.registerScreen?.tfFullName.delegate = self
        self.registerScreen?.tfEmailAddress.delegate = self
        self.registerScreen?.tfPassword.delegate = self
        self.registerScreen?.registerButton.isEnabled = false
        self.view = self.registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //self.registerScreen?.registerButton.isEnabled = false
        self.registerScreen?.registerButton.setTitleColor(.lightGray, for: .normal)
        print("textFieldDidBeginEditing")
    
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == self.registerScreen?.tfFullName {
            self.registerScreen?.tfEmailAddress.becomeFirstResponder()

        } else if textField == self.registerScreen?.tfEmailAddress {
            self.registerScreen?.tfPassword.becomeFirstResponder()

        }
        
        if registerScreen?.tfFullName.text == "" {
            self.registerScreen?.registerButton.isEnabled = false
        } else if registerScreen?.tfEmailAddress.text == "" {
            self.registerScreen?.registerButton.isEnabled = false
        } else if registerScreen?.tfPassword.text == "" {
            self.registerScreen?.registerButton.isEnabled = false
        } else {
            self.registerScreen?.registerButton.setTitleColor(.white, for: .normal)
            self.registerScreen?.tfPassword.resignFirstResponder()
            
            self.registerScreen?.registerButton.isEnabled = true
        }
    
        return true
    }
}

extension RegisterVC: RegisterScreenProtocol {
    func actionBackButton() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        self.navigationController?.popViewController(animated: true)
        print(#function)
    }
}

