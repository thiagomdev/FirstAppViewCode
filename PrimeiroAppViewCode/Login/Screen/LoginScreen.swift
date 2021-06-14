//
//  LoginScreen.swift
//  PrimeiroAppViewCode
//
//  Created by Thiago Monteiro  on 14/04/21.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView, UITextFieldDelegate {
    
    weak var delegate: LoginScreenProtocol?
    
    func delegate(delegate: LoginScreenProtocol?) {
        self.delegate = delegate
    }
    // MARK: - Create the Elements
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Login Firebase"
        return label
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "firebase3")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var textFieldPassword: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.keyboardType = .default
        tf.textAlignment = .center
        tf.borderStyle = .roundedRect
        tf.clearButtonMode = .whileEditing
        tf.backgroundColor = .white
        tf.autocorrectionType = .no
        tf.clipsToBounds = true
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    lazy var textFieldEmail: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Your e-mail address"
        tf.keyboardType = .emailAddress
        tf.textAlignment = .center
        tf.keyboardType = .default
        tf.borderStyle = .roundedRect
        tf.clearButtonMode = .whileEditing
        tf.backgroundColor = .white
        tf.autocorrectionType = .no
        tf.clipsToBounds = true
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    lazy var customButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Sign In", for: .normal)
        bt.setTitleColor(UIColor.lightGray, for: .normal)
        bt.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(14))
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 7.5
        bt.addTarget(self, action: #selector(self.buttonLoginTapped), for: .touchUpInside)
        return bt
    }()
    
    @objc private func buttonLoginTapped() {
        self.delegate?.actionLoginButton()
    }
    
    @objc private func buttonRegister() {
        self.delegate?.actionRegisterButton()
    }
    
    // MARK: - Delegate Config Text Fields
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.textFieldPassword.delegate = delegate
        self.textFieldEmail.delegate = delegate
    }
    
    lazy var customButtonRegister: UIButton = {
        let buttonRegister = UIButton()
        buttonRegister.setTitle("Ready to Register?", for: .normal)
        buttonRegister.setTitleColor(UIColor.white, for: .normal)
        buttonRegister.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(14))
        buttonRegister.addTarget(self, action: #selector(self.buttonRegister), for: .touchUpInside)
        return buttonRegister
    }()
    
    
    // MARK: - Super View Construction
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
        
        // MARK: - SubViews
        self.addNewSubView()
        self.configConstraintLoginLabel()
        self.configConstraintLogoAppImageView()
        self.configConstraintTextFieldEmail()
        self.configConstraintTextFieldPassword()
        self.configConstraintLoginButton()
        self.configConstraintLoginRegisterButton()
        self.buttonLoginTapped()
        self.buttonRegister()

    }
    
    // MARK: - Methods Text Field isEmpty
    public func passwordIsEmpty() {
        if self.textFieldPassword.text == "" {
            self.textFieldPassword.layer.borderColor = UIColor.red.cgColor
            
        } else {
            self.textFieldPassword.layer.borderColor = UIColor.lightText.cgColor
            self.textFieldPassword.borderStyle = .roundedRect
        }
    }
    
    public func emailIsEmpty() {
        if self.textFieldEmail.text == "" {
            self.textFieldEmail.layer.borderColor = UIColor.red.cgColor
            
        } else {
            self.textFieldEmail.layer.borderColor = UIColor.lightText.cgColor
            self.textFieldEmail.borderStyle = .roundedRect
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Method Add New Sub View
    func addNewSubView() {
        self.addSubview(self.loginLabel)
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.textFieldPassword)
        self.addSubview(self.textFieldEmail)
        self.addSubview(self.customButton)
        self.addSubview(self.customButtonRegister)
    }
    
    // MARK: - SnapKit Constraints
    func configConstraintLoginLabel() {
        self.loginLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    func configConstraintLogoAppImageView() {
        self.logoAppImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.loginLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
            make.height.equalTo(200)
        }
    }
    
    func configConstraintTextFieldEmail() {
        self.textFieldEmail.snp.makeConstraints { (make) in
            make.top.equalTo(self.logoAppImageView.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }
    
    func configConstraintTextFieldPassword() {
        self.textFieldPassword.snp.makeConstraints { (make) in
            make.top.equalTo(self.textFieldEmail.snp.bottom).offset(15)
            make.leading.equalTo(self.textFieldEmail.snp.leading)
            make.trailing.equalTo(self.textFieldEmail.snp.trailing)
            make.height.equalTo(self.textFieldEmail.snp.height)
        }
    }
    
    func configConstraintLoginButton() {
        self.customButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.textFieldPassword.snp.bottom).offset(15)
            make.leading.equalTo(self.textFieldEmail.snp.leading)
            make.trailing.equalTo(self.textFieldEmail.snp.trailing)
            make.height.equalTo(self.textFieldEmail.snp.height)
        }
    }
    
    func configConstraintLoginRegisterButton() {
        self.customButtonRegister.snp.makeConstraints { (make) in
            make.top.equalTo(self.customButton.snp.bottom).offset(15)
            make.leading.equalTo(self.textFieldEmail.snp.leading)
            make.trailing.equalTo(self.textFieldEmail.snp.trailing)
            make.height.equalTo(self.textFieldEmail.snp.height)
        }
    }
}

