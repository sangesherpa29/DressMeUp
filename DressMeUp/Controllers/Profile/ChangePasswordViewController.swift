//
//  ChangePasswordViewController.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 20/06/2023.
//

import UIKit
import SnapKit
import RxSwift
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class ChangePasswordViewController: UIViewController {
    
    lazy var fieldStack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.addArrangedSubview(oldPassword)
        stack.addArrangedSubview(newPassword)
        stack.addArrangedSubview(confirmPassword)
        return stack
    }()
    
    var saveBtn = customButton(title: "Save", titleColor: .primaryLabelColor)
    
    @FormMaterialTextField(placeholder: "Old Password", isSecureTextEntry: true) var oldPassword : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "New Password", isSecureTextEntry: true) var newPassword : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "Confirm Password", isSecureTextEntry: true) var confirmPassword : MaterialComponents.MDCOutlinedTextField

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        oldPassword.apply {
            $0.enablePasswordToggle()
        }
        newPassword.apply {
            $0.enablePasswordToggle()
        }
        confirmPassword.apply {
            $0.enablePasswordToggle()
        }
    }
    
    private func setup() {
        view.backgroundColor = .mainBackgroundColor
        view.addSubview(fieldStack)
        view.addSubview(saveBtn)
        
        fieldStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        saveBtn.snp.makeConstraints { make in
            make.top.equalTo(fieldStack.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
        }
    }
}
