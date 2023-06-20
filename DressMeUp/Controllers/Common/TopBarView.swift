//
//  TopBarView.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 01/06/2023.
//

import UIKit
import SnapKit

public func getTopBar(
    withTitle title: String,
    withColor titleColor: UIColor = UIColor.primaryLabelColor,
    background backgroundColor: UIColor = UIColor.mainThemeColor) -> UIView {
        
        // Labels
        lazy var mainLabel : UILabel = {
            var label = UILabel()
            label.text = title
            label.font = UIFont(name: "OpenSans-Bold", size: 28)
            label.textColor = titleColor
            return label
        }()
        
        // Main Contaier View
        lazy var topBar : UIView = {
            var topBar = UIView()
            topBar.backgroundColor = backgroundColor
            topBar.addSubview(mainLabel)
            return topBar
        }()

        mainLabel.snp.makeConstraints { make in
            make.centerY.equalTo(topBar)
            make.left.equalTo(topBar).offset(20)
        }
    
    return topBar
}
