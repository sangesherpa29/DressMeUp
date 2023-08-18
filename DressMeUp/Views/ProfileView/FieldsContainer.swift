//
//  FieldsContainer.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 06/06/2023.
//

import Foundation
import SnapKit
import UIKit

func getFieldContainer(
    textLabel: String,
    textLabelFont: UIFont? = UIFont(name: "OpenSans-SemiBold", size: 15),
    textLabelValue: String = "",
    textLabelValueFont: UIFont? = UIFont(name: "OpenSans-Regular", size: 13)
    ) -> UIView {
    
    let fieldTextLabel: UILabel = {
       let fieldTextLabel = UILabel()
        fieldTextLabel.text = textLabel
        fieldTextLabel.textColor = .black
        fieldTextLabel.font = textLabelFont
        return fieldTextLabel
    }()
    
    let fieldTextLabelValue: UILabel = {
       let fieldTextLabelValue = UILabel()
        fieldTextLabelValue.text = textLabelValue
        fieldTextLabelValue.textColor = .black
        fieldTextLabelValue.font = textLabelValueFont
        return fieldTextLabelValue
    }()
    
    lazy var fieldStack : UIStackView = {
       let fieldStack = UIStackView()
        fieldStack.axis = .vertical
        fieldStack.spacing = 5
        fieldStack.addArrangedSubview(fieldTextLabel)
        fieldStack.addArrangedSubview(fieldTextLabelValue)
        return fieldStack
    }()
    
    lazy var stackContainer : UIView = {
        let stackContainer = UIView()
        stackContainer.backgroundColor = UIColor.mainBackgroundColor
        stackContainer.addSubview(fieldStack)
        return stackContainer
    }()
        
        
    fieldStack.snp.makeConstraints { make in
        make.top.left.equalTo(stackContainer).offset(20)
    }
    stackContainer.snp.makeConstraints { make in
        make.height.equalTo(80)
    }
    
    return stackContainer
}
