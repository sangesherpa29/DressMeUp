//
//  ProfileTableViewCell.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 04/06/2023.
//

import UIKit
import SnapKit

class ProfileTableViewCell: UITableViewCell {
    
    static let identifier = "ProfileTableViewCell"
    
    var label: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "OpenSans-SemiBold", size: 15)
        label.text = "Label"
        label.textColor = .black
        return label
    }()

    var labelValue: UILabel = {
        var labelValue = UILabel()
        labelValue.font = UIFont(name: "OpenSans-Regular", size: 13)
        labelValue.text = "Label value"
        labelValue.textColor = .black
        return labelValue
    }()
    
    lazy var fieldContainer : UIView = {
        var fieldContainer = UIView()
        fieldContainer.backgroundColor = UIColor.mainBackgroundColor
        fieldContainer.addSubview(label)
        fieldContainer.addSubview(labelValue)
        return fieldContainer
    }()
    
    
    // MARK: Main Calling Method
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(fieldContainer)
        
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
        }
        labelValue.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
