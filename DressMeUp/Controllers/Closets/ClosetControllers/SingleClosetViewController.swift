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
    
    lazy var cameraButton: UIButton = {
        var cameraButton = UIButton()
        let image = UIImage(systemName: "camera.circle")?.withTintColor(UIColor.mainThemeColor, renderingMode: .alwaysOriginal)
        cameraButton.setBackgroundImage(image, for: .normal)
        return cameraButton
    }()
    
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
        view.addSubview(cameraButton)
        
        cameraButton.addTarget(self, action: #selector(cameraTappedAction), for: .touchUpInside)
        
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
        
        cameraButton.snp.makeConstraints { make in
            make.width.height.equalTo(60)
            make.right.bottom.equalTo(view.safeAreaLayoutGuide).offset(-25)
        }
    }
    
    @objc func cameraTappedAction() {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default) { _ in
            let vc = UIImagePickerController()
            vc.sourceType = .photoLibrary
            vc.delegate = self
            vc.allowsEditing = true
            self.present(vc, animated: true)
        })
        
        alert.addAction(UIAlertAction(title: "Open Camera", style: .default) { _ in
            let vc = UIImagePickerController()
            vc.sourceType = .camera
            vc.delegate = self
            vc.allowsEditing = true
            self.present(vc, animated: true)
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default) { _ in
            self.dismiss(animated: true)
        })
        
        self.present(alert, animated: true)
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


extension SingleClosetViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private func openAlert(with name: String, msg message: String) {
//        let alert = UIAlertController(title: name, message: <#T##String?#>, preferredStyle: .)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.originalImage] as? UIImage {
            // set the image to the collection view cell
            
            // code here
            
            
            
            // convert image to Data
            if let imageData = selectedImage.jpegData(compressionQuality: 0.8) {
                let closetObj = Closet()
                let itemObj = Item()
                itemObj.imageData = imageData
//                itemObj.
//                closetObj.items.append("")
                
            }
        }
    }
    
}
