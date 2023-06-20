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

