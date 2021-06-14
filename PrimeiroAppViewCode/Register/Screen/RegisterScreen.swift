//
//  RegisterScreen.swift
//  PrimeiroAppViewCode
//
//  Created by Thiago Monteiro  on 18/04/21.
//

import UIKit

protocol RegisterScreenProtocol {
    func actionBackButton()
    func actionRegisterButton()
}
class RegisterScreen: UIView {
    
    var delegate: RegisterScreenProtocol?
    
    func delegate(delegate: RegisterScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var tfFullName: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Full Name"
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.keyboardType = .default
        tf.borderStyle = .roundedRect
        tf.textAlignment = .center
        tf.clearButtonMode = .whileEditing
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    lazy var tfEmailAddress: UITextField = {
        let tf = UITextField()
        tf.placeholder = "E-mail Address"
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.keyboardType = .default
        tf.borderStyle = .roundedRect
        tf.textAlignment = .center
        tf.clearButtonMode = .whileEditing
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    lazy var tfPassword: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.keyboardType = .default
        tf.borderStyle = .roundedRect
        tf.textAlignment = .center
        tf.clearButtonMode = .whileEditing
        tf.isSecureTextEntry = true
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    lazy var registerButton: UIButton = {
        let rb = UIButton()
        rb.setTitle("Register", for: .normal)
        rb.setTitleColor(UIColor.lightGray, for: .normal)
        rb.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        rb.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(14))
        rb.layer.cornerRadius = 7.5
        rb.clipsToBounds = true
        rb.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return rb
    }()
    
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "firebase3")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var buttonImageRegisterBack: UIButton = {
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        return backButton
    }()
    
    // MARK: - Actions pf Buttons
    @objc private func tappedBackButton() {
        self.delegate?.actionBackButton()
    }
    
    @objc private func tappedRegisterButton() {
        self.delegate?.actionRegisterButton()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
        
        self.customAddSubViews()
        self.configConstraintLogoImageView()
        self.configConstraintRegisterBackButton()
        self.configConstraintTextFieldEmailAddress()
        self.configConstraintTextFielPassword()
        self.configConstraintTextFieldRegister()
        self.configConstraintTextFieldFullName()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customAddSubViews() {
        self.addSubview(tfFullName)
        self.addSubview(tfEmailAddress)
        self.addSubview(tfPassword)
        self.addSubview(registerButton)
        self.addSubview(logoAppImageView)
        self.addSubview(buttonImageRegisterBack)
    
    }
    
    func configConstraintLogoImageView() {
        self.logoAppImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(150)
        }
    }
    
    func configConstraintRegisterBackButton() {
        self.buttonImageRegisterBack.snp.makeConstraints { (make) in
            make.top.equalTo(self.logoAppImageView.snp.top)
            make.leading.equalToSuperview()
        }
    }
    
    func configConstraintTextFieldEmailAddress() {
        self.tfEmailAddress.snp.makeConstraints { (make) in
            make.top.equalTo(self.tfFullName.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }
    
    func configConstraintTextFieldFullName() {
        self.tfFullName.snp.makeConstraints { (make) in
            make.top.equalTo(self.logoAppImageView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }
    
    func configConstraintTextFielPassword() {
        self.tfPassword.snp.makeConstraints { (make) in
            make.top.equalTo(self.tfEmailAddress.snp.bottom).offset(15)
            make.leading.equalTo(self.tfEmailAddress.snp.leading)
            make.trailing.equalTo(self.tfEmailAddress.snp.trailing)
            make.height.equalTo(self.tfEmailAddress.snp.height)
        }
    }
    
    func configConstraintTextFieldRegister() {
        self.registerButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.tfPassword.snp.bottom).offset(15)
            make.leading.equalTo(self.tfEmailAddress.snp.leading)
            make.trailing.equalTo(self.tfEmailAddress.snp.trailing)
            make.height.equalTo(self.tfEmailAddress.snp.height)
        }
    }
}
