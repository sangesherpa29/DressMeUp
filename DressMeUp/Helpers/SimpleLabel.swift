//
//  SimpleLabel.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 10/07/2023.
//

import Foundation
import UIKit

func customLabel(
    title: String,
    titleColor: UIColor,
    titleFont: UIFont? = UIFont(name: "OpenSans-Regular", size: 13)
) -> UILabel {
    
    let label = UILabel()
    label.text = title
    return label
}
