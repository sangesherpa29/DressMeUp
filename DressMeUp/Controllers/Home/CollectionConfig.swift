//
//  CollectionConfig.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 11/07/2023.
//

import Foundation
import UIKit
import Alamofire

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2-5, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CustomCollectionViewCell.identifier,
            for: indexPath) as! CustomCollectionViewCell
                        
        // Configure the cell
        let imageURL = results[indexPath.row].cover_photo.urls.regular
        cell.configure(with: imageURL)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoExpandedVC = PhotoExpandedViewController()
        let currentImage = imageArray[indexPath.row]
        photoExpandedVC.photoImageView.image = UIImage(named: "\(currentImage)")
        self.navigationController?.pushViewController(photoExpandedVC, animated: true)
    }
    
}
