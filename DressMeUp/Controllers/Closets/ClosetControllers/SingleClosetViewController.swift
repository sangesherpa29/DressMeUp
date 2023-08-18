//
//  InnerViewController.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 02/08/2023.
//

import UIKit
import SnapKit
import MaterialComponents.MaterialTabs_TabBarView

class SingleClosetViewController: UIViewController {
    
    let tabBarView = MDCTabBarView()
    let outfitsView = OutfitsView()
    let piecesView = PiecesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.mainBackgroundColor
        view.addSubview(tabBarView)
        view.addSubview(outfitsView)
        view.addSubview(piecesView)
        
        tabBarView.items = [
            UITabBarItem(title: "Outfits", image: nil , tag: 0),
            UITabBarItem(title: "Pieces", image: nil , tag: 1)
        ]
        
        tabBarView.selectionIndicatorStrokeColor = UIColor.mainThemeColor
        tabBarView.setTitleColor(UIColor.mainThemeColor, for: .selected)
        tabBarView.setTitleFont(UIFont(name: "OpenSans-Regular", size: 14), for: .normal)
        tabBarView.setTitleFont(UIFont(name: "OpenSans-Regular", size: 14), for: .selected)
        tabBarView.setSelectedItem(tabBarView.items[0], animated: true)
        tabBarView.tabBarDelegate = self
        piecesView.isHidden = true
        
        tabBarView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.left.equalToSuperview().offset(7)
            make.right.equalToSuperview().offset(-7)
            make.height.equalTo(40)
        }
        
        outfitsView.snp.makeConstraints { make in
            make.top.equalTo(self.tabBarView.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(7)
            make.right.equalToSuperview().offset(-7)
            make.bottom.equalToSuperview()
        }
        
        piecesView.snp.makeConstraints { make in
            make.top.equalTo(self.tabBarView.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(7)
            make.right.equalToSuperview().offset(-7)
            make.bottom.equalToSuperview()
        }
    }
}


extension SingleClosetViewController : MDCTabBarViewDelegate {
    func tabBarView(_ tabBarView: MDCTabBarView, didSelect item: UITabBarItem) {
        
        switch item.tag {
        case 0:
            outfitsView.isHidden = false
            piecesView.isHidden = true
            break
        case 1:
            outfitsView.isHidden = true
            piecesView.isHidden = false
            break
        default:
            break
        }
    }
}
