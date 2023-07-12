//
//  FieldPropertyWrapper.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 20/06/2023.
//

import Foundation
import UIKit

import MaterialComponents.MaterialTextControls_OutlinedTextFields

@propertyWrapper
public class FormMaterialTextField {
    public var wrappedValue: MaterialComponents.MDCOutlinedTextField

    public init(placeholder: String, keyboardType: UIKeyboardType = .default, capitalizationType: UITextAutocapitalizationType = .words, isSecureTextEntry: Bool = false, leftView : UIImageView? = nil, alignment: NSTextAlignment = .left){
        
        self.wrappedValue = MaterialComponents.MDCOutlinedTextField()
        wrappedValue.placeholder = placeholder
        wrappedValue.textAlignment = alignment
        wrappedValue.keyboardType = keyboardType
        wrappedValue.autocapitalizationType = capitalizationType
        wrappedValue.isSecureTextEntry = isSecureTextEntry
        wrappedValue.leadingView = leftView
        wrappedValue.leadingViewMode = .always
        wrappedValue.font = UIFont(name: "OpenSans-SemiBold", size: 15)
        wrappedValue.label.text = placeholder
        wrappedValue.setNormalLabelColor(.systemGray, for: .normal)
        wrappedValue.setOutlineColor(UIColor.clear, for: .normal)
        wrappedValue.setFloatingLabelColor(UIColor.systemGray, for: .normal)
        wrappedValue.verticalDensity = 1
        wrappedValue.setOutlineColor(UIColor.systemGray, for: .normal)
        wrappedValue.layer.cornerRadius = 8
        wrappedValue.preferredContainerHeight = 44
        wrappedValue.sizeToFit()
    }
}

extension MDCOutlinedTextField{
    
    func enablePasswordToggle(){
        
        let passwordHidden = UIImage(named: "ic_password_hidden")! as UIImage
        let passwordVisible = UIImage(named: "ic_password_visible")! as UIImage
        
        
        let toggleView = UIImageView(image: passwordHidden).apply{ [self] view in
            view.addOnClickListner {
                self.isSecureTextEntry = !self.isSecureTextEntry
                view.image = self.isSecureTextEntry ? passwordHidden : passwordVisible
            }
            view.contentMode = .scaleAspectFit
            view.alpha = 0.2
            view.frame = CGRect(origin: .zero, size:CGSize(width: 20, height: 20))
        }
        self.trailingViewMode = .always
        self.trailingView = toggleView
        
    }
    
    func addTrailingView(view:UIView){
        self.trailingViewMode = .always
        self.trailingView = view
    }
    
    func addLeadingView(view:UIView){
        self.leadingViewMode = .always
        self.leadingView = view
    }
    
}

