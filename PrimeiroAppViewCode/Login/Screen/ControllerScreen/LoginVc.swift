//
//  ViewController.swift
//  PrimeiroAppViewCode
//
//  Created by Thiago Monteiro  on 14/04/21.
//

import UIKit
// Desafio de colocar 2 textFields e 1 botão

class LoginVc: UIViewController {
    
    var loginScreen: LoginScreen?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.loginScreen?.delegate(delegate: self)
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.loginScreen?.customButton.isEnabled = false
        self.view = self.loginScreen
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = .green
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func validateTextField() {
        let password: String = self.loginScreen?.textFieldPassword.text ?? ""
        let email: String = self.loginScreen?.textFieldEmail.text ?? ""
       
        if !password.isEmpty && !email.isEmpty {
            self.loginScreen?.customButton.setTitleColor(.white, for: .normal)
            self.loginScreen?.customButton.isEnabled = true
            
        } else {
            self.loginScreen?.customButton.isEnabled = true
        }
    }
}



extension LoginVc: LoginScreenProtocol {    
    func actionLoginButton() {
        print("Login Button")
        let userDetail = UserDetailVC()
        self.navigationController?.pushViewController(userDetail, animated: true)
        
    }
    
    func actionRegisterButton() {
        print("Register Button")
        let register = RegisterVC()
        self.navigationController?.pushViewController(register, animated: true)
        
    }
}

extension LoginVc: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.borderWidth = 1.5
    
        self.loginScreen?.customButton.setTitleColor(.lightGray, for: .normal)
        self.loginScreen?.customButton.isEnabled = true
        print("textFieldDidBeginEditing")
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField {
        case self.loginScreen?.textFieldPassword:
            self.loginScreen?.passwordIsEmpty()
            
        case self.loginScreen?.textFieldEmail:
            self.loginScreen?.emailIsEmpty()
            self.validateTextField()
        default:break
            
        }
    
        print("textFieldDidEndEditing")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.loginScreen?.customButton.setTitleColor(.white, for: .normal)
        self.loginScreen?.customButton.isEnabled = true
        return true
    }
}
