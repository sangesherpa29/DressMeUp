//
//  PiecesView.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 02/08/2023.
//

import Foundation
import UIKit
import SnapKit

class PiecesView: UIView {
    
    var clothingItem = [UIImage?]()
    
    lazy var piecesCollectionView : UICollectionView = {
        var flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        flowlayout.minimumInteritemSpacing = 10
        flowlayout.minimumLineSpacing = 10
        
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)        
        self.addSubview(piecesCollectionView)
        
        piecesCollectionView.dataSource = self
        piecesCollectionView.delegate = self
        
        clothingItem.append(UIImage(named: "img1"))
        clothingItem.append(UIImage(named: "img2"))
        clothingItem.append(UIImage(named: "img3"))
        clothingItem.append(UIImage(named: "img4"))
        clothingItem.append(UIImage(named: "img1"))
        clothingItem.append(UIImage(named: "img2"))
        clothingItem.append(UIImage(named: "img3"))
        clothingItem.append(UIImage(named: "img4"))
        clothingItem.append(UIImage(named: "img1"))
        clothingItem.append(UIImage(named: "img2"))
        clothingItem.append(UIImage(named: "img3"))
        clothingItem.append(UIImage(named: "img4"))
        clothingItem.append(UIImage(named: "img1"))
        clothingItem.append(UIImage(named: "img2"))
        clothingItem.append(UIImage(named: "img3"))
        clothingItem.append(UIImage(named: "img4"))
        
        piecesCollectionView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(8)
            make.bottom.right.equalToSuperview().offset(-8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PiecesView : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        clothingItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/2-5, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CustomCollectionViewCell.identifier,
            for: indexPath) as? CustomCollectionViewCell else {
            print("Could not cast Cell")
            return UICollectionViewCell()
        }

        // Configure the cell
        cell.imageView.image = clothingItem[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoExpandedVC = PhotoExpandedViewController()
        photoExpandedVC.photoImageView.image = clothingItem[indexPath.row]
        self.inputViewController?.navigationController?.pushViewController(photoExpandedVC, animated: true)
    }
}
