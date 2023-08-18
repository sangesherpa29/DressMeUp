//
//  PHAsset.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 03/08/2023.
//

import Foundation
import Photos
import UIKit
import RxSwift
import SDWebImage

extension PHAsset{
    func asUIImage(width:Int = 1280, height:Int = 850) -> Single<UIImage?>{
        .create { subscriber in
            let manager = PHImageManager.default()
            let option = PHImageRequestOptions().apply { it in
                it.isSynchronous = false
                it.isNetworkAccessAllowed = true
                it.deliveryMode = .highQualityFormat
            }
            
            let requestId =  manager.requestImage(for: self, targetSize: .init(width: width , height: height), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
                subscriber(.success(result))
            })
            
            return Disposables.create {
                manager.cancelImageRequest(requestId)
            }
        }
    }
}

extension UIImageView {
    func loadImage(src:String?, type:ImageType = .Other){
        
        guard let src = src else {
            self.image = type.getPlaceHolderImage()
            return
        }
        self.image = nil
        self.backgroundColor = .lightGray
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_setImage(with: URL(string: src), placeholderImage: nil, options: [.scaleDownLargeImages]) { (image, error, cacheType, url) in
            switch(error){
            case .none:
                self.image = image
                break;
            case .some(_):
                self.image = type.getPlaceHolderImage()
            }
        }
    }
}

enum ImageType{
    case User
    case Pet
    case Other
    
    func getPlaceHolderImage()->UIImage?{
        var name = ""
        
        switch(self){
        case .Other:
            name = "ic_image_placeholder.png"
            break
        case .User:
            name = "ic_user_placeholder.png"
            break
        case .Pet:
            name = "ic_pet_placeholder.png"
            break
        }
        
        return UIImage(named: name)
    }
}
