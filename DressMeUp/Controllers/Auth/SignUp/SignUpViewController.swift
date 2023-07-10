//
//  SignUpViewController.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 10/07/2023.
//

import UIKit
import SnapKit
import RxSwift
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class SignUpViewController: UIViewController {
    
    lazy var fieldStack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.addArrangedSubview(name)
        stack.addArrangedSubview(email)
        stack.addArrangedSubview(password)
        stack.addArrangedSubview(confirmPassword)
        stack.addArrangedSubview(gender)
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
    
    var haveAccount = customLabel(title: "Already have an account?", titleColor: .black)
        
    var signInInsteadButton: UIButton = {
        var btn = UIButton()
        btn.titleLabel?.font = UIFont(name: "OpenSans-Regular", size: 13)
//        btn.titleLabel.textStyle = .
        btn.setTitle("sign in".uppercased(), for: .normal)
        btn.setTitleColor(UIColor.mainThemeColor, for: .normal)
        btn.backgroundColor = .none
        return btn
    }()
    
    var registerButton = customButton(title: "Register", titleColor: .primaryLabelColor)
    
    @FormMaterialTextField(placeholder: "Name") var name : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "Email") var email : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "Password") var password : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "Confirm Password") var confirmPassword : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "Gender") var gender : MaterialComponents.MDCOutlinedTextField

    
    // MARK: Main Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .mainBackgroundColor
        view.addSubview(fieldStack)
        view.addSubview(registerButton)
        view.addSubview(signInInsteadButton)
        view.addSubview(bottomStack)
        
        signInInsteadButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        
        fieldStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(fieldStack.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        bottomStack.snp.makeConstraints { make in
            make.top.equalTo(registerButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func signInTapped() {
        let signInVC = SignUpViewController()
        self.present(signInVC, animated: true)
    }
}
