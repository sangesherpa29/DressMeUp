//
//  ImageRelated.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 03/08/2023.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import BSImagePicker

extension UIViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func pickImageSource() -> Maybe<UIImagePickerController.SourceType>{
        return .create{ [self] maybe in
            let alert = UIAlertController(title: "Add Photo", message: "Please select a method", preferredStyle: .alert)
        
            alert.addAction(UIAlertAction(title: "Add from library", style: .default) { _ in
                let vc = UIImagePickerController()
                vc.sourceType = .photoLibrary
                vc.delegate = self
                vc.allowsEditing = true
                self.present(vc, animated: true)
            })
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .default) { _ in
                alert.dismiss(animated: true)
            })
            
            self.present(alert, animated: true, completion: nil)
            return Disposables.create {
                alert.dismiss(animated: true)
            }
        }
    }
    
    
    func pickImagesFromGallery(max:Int = Int.max) -> Maybe<[UIImage]>{
        
        return Maybe.create{ [self] maybe in
            
            let imagePicker = ImagePickerController()
            
            imagePicker.settings.selection.max = max
            
            self.presentImagePicker(imagePicker, animated: true) { asset in
                
            } deselect: { asset in
                
            } cancel: { assets in
                maybe(.completed)
            } finish: { assets in
                maybe(.success(assets))
            } completion: {
                
            }
            
            return Disposables.create {
                imagePicker.dismiss(animated: true)
            }
        }.asObservable()
            .flatMap {
                Observable.from($0)
            }.flatMap {
                $0.asUIImage()
                    .filter{ $0 != nil }
                    .map{ $0! }
                    .asObservable()
            }.toArray()
            .asMaybe()
        
    }

    
    func pickImages(max:Int = Int.max) -> Maybe<[UIImage]>{
        pickImageSource()
            .flatMap { [self] source in
                return pickImagesFromGallery(max: max)
            }
    }
    
}
