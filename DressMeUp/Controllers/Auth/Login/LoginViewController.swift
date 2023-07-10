//
//  LoginViewController.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 10/07/2023.
//

import UIKit
import SnapKit
import RxSwift
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class LoginViewController: UIViewController {
    
    lazy var fieldStack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.addArrangedSubview(email)
        stack.addArrangedSubview(password)
        return stack
    }()
    
    lazy var bottomStack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        
        stack.addArrangedSubview(haveAccount)
        stack.addArrangedSubview(signInInsteadButton)
        return stack
    }()
    
    var haveAccount = customLabel(title: "No account yet?", titleColor: .black)
        
    var signInInsteadButton: UIButton = {
        var btn = UIButton()
        btn.titleLabel?.font = UIFont(name: "OpenSans-Regular", size: 13)
        btn.setTitle("register".uppercased(), for: .normal)
        btn.setTitleColor(UIColor.mainThemeColor, for: .normal)
        btn.backgroundColor = .none
        return btn
    }()
    
    var registerButton = customButton(title: "Register", titleColor: .primaryLabelColor)
    
    @FormMaterialTextField(placeholder: "Email") var email : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "Password") var password : MaterialComponents.MDCOutlinedTextField
        
    // MARK: Main Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .mainBackgroundColor
        view.addSubview(fieldStack)
        view.addSubview(registerButton)
        view.addSubview(bottomStack)
        
        signInInsteadButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        
        fieldStack.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(fieldStack.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }
        bottomStack.snp.makeConstraints { make in
            make.top.equalTo(registerButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    
    @objc func registerTapped() {
        let registerVC = SignUpViewController()
        self.present(registerVC, animated: true)
    }
}
