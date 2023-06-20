//
//  TopBarView.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 01/06/2023.
//

import UIKit

class TopBarView: UIView {
    
    // MARK: Color Variables
    var primaryLabelColor : UIColor = {
        return UIColor(red: 238/255, green: 245/255, blue: 219/255, alpha: 1)
    }()
    
    var primaryColor : UIColor = {
        return UIColor(red: 79/255, green: 99/255, blue: 103/255, alpha: 1)
    }()
    
    var backColor : UIColor = {
        return UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
    }()
    
    // MARK: Labels
    lazy var inspirationsLabel : UILabel = {
        var inspirationsLabel = UILabel()
        inspirationsLabel.text = "Inspirations"
        inspirationsLabel.font = UIFont(name: "Lato-Black", size: 30)
        inspirationsLabel.textColor = primaryLabelColor
        return inspirationsLabel
    }()
    
    lazy var cameraButton: UIButton = {
        var cameraButton = UIButton()
        let image = UIImage(systemName: "camera.circle")?.withTintColor(primaryLabelColor, renderingMode: .alwaysOriginal)
        cameraButton.setBackgroundImage(image, for: .normal)
        return cameraButton
    }()
    
    lazy var topBarStack : UIStackView = {
        var topBarStack = UIStackView()
        topBarStack.axis = .horizontal
        topBarStack.alignment = .center
        topBarStack.distribution = .fill
        topBarStack.addArrangedSubview(inspirationsLabel)
        topBarStack.addArrangedSubview(cameraButton)
        return topBarStack
    }()
    
    
    // MARK: Container Views
    lazy var topBar : UIView = {
        var topBar = UIView()
        topBar.backgroundColor = primaryColor
        topBar.addSubview(topBarStack)
        return topBar
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(topBar)
                
        // MARK: Constraints
        topBar.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.height.equalTo(100)
        }
        
        topBarStack.snp.makeConstraints { make in
            make.left.equalTo(self.topBar).offset(20)
            make.right.bottom.equalTo(self.topBar).offset(-20)
        }
        cameraButton.snp.makeConstraints { make in
            make.width.height.equalTo(50)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
