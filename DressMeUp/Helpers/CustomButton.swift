//
//  CustomButton.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 04/06/2023.
//

import Foundation
import UIKit

func customButton(
    backgroundColor : UIColor = UIColor.mainThemeColor,
    title: String,
    titleColor: UIColor,
    titleFont: UIFont? = UIFont(name: "OpenSans-Bold", size: 13)
) -> UIButton {
    
    var button = UIButton()
    button.setTitle(title, for: .normal)
    button.titleLabel?.font = titleFont
    button.setTitleColor(titleColor, for: .normal)
    button.backgroundColor = backgroundColor
    
    button.layer.cornerRadius = 10
    button.contentEdgeInsets = UIEdgeInsets(top: 15, left: 30, bottom: 15, right: 30)
    return button
}
