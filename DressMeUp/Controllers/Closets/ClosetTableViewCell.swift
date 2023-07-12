//
//  ClosetTableViewCell.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 12/07/2023.
//

import UIKit
import SnapKit

class ClosetTableViewCell: UITableViewCell {
    
    static let identifier = "ClosetTableViewCell"
    
    var nameLabel: UILabel = {
        var label = UILabel()
        label.text = "Dummy Text"
        label.font = UIFont(name: "OpenSans-Bold", size: 20)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
