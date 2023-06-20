//
//  ClosetsViewController.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 18/05/2023.
//

import UIKit
import SnapKit

class ClosetsViewController: UIViewController {
    
    var topBar = getTopBar(withTitle: "Closets")

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = UIColor.mainBackgroundColor
        view.addSubview(topBar)
        
        topBar.snp.makeConstraints { make in
            make.left.top.right.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(80)
        }
    }

}
