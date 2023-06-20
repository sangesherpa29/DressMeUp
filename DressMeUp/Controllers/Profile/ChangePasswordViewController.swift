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
    
    @FormMaterialTextField(placeholder: "Old Password") var oldPassword : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "New Password") var newPassword : MaterialComponents.MDCOutlinedTextField
    @FormMaterialTextField(placeholder: "Confirm Password") var confirmPassword : MaterialComponents.MDCOutlinedTextField

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .mainBackgroundColor
        view.addSubview(fieldStack)
        
        fieldStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.left.right.equalToSuperview()
        }
    }
}
