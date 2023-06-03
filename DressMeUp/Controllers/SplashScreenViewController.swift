//
//  SplashScreenViewController.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 02/06/2023.
//

import UIKit
import SnapKit

class SplashScreenViewController: UIViewController {
    
    // MARK: Color Variables
    var orangeColor : UIColor = {
        return UIColor(red: 254/255, green: 95/255, blue: 85/255, alpha: 1)
    }()
    
    var mainBackgroundColor : UIColor = {
        return UIColor(red: 79/255, green: 99/255, blue: 103/255, alpha: 1)
    }()
    
    var splashLabelColor : UIColor = {
        return UIColor(red: 238/255, green: 245/255, blue: 219/255, alpha: 1)
    }()
    
    
    lazy var containerView: UIView = {
        var containerView  = UIView()
        containerView.backgroundColor = orangeColor
        containerView.addSubview(splashLabel)
        return containerView
    }()
    
    lazy var splashLabel: UILabel = {
        var splashLabel = UILabel()
        splashLabel.text = "Dress Me Up"
        splashLabel.textColor = splashLabelColor
        splashLabel.font = UIFont(name: "OpenSans-Bold", size: 40)
        return splashLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = mainBackgroundColor
        
        view.addSubview(containerView)
        
        containerView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(200)
            make.center.equalToSuperview()
        }
        splashLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
