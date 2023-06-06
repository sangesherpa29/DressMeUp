//
//  SplashScreenViewController.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 02/06/2023.
//

import UIKit
import SnapKit

class SplashScreenViewController: UIViewController {

    lazy var containerView: UIView = {
        var containerView  = UIView()
        containerView.backgroundColor = UIColor.orangeColor
        containerView.addSubview(splashLabel)
        return containerView
    }()
    
    lazy var splashLabel: UILabel = {
        var splashLabel = UILabel()
        splashLabel.text = "Dress Me Up"
        splashLabel.textColor = UIColor.splashLabelColor
        splashLabel.font = UIFont(name: "OpenSans-Bold", size: 40)
        return splashLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.mainBackgroundColor
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
