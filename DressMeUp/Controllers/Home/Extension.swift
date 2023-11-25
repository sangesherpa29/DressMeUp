//
//  Extension.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 08/10/2023.
//

import Foundation
import UIKit

extension UIImage {
    
    func resizedImage(with size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        draw(in: CGRect(origin: .zero, size: size))

        // Create Image from Current Graphics Context
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()

        // Clean Up Graphics Context
        UIGraphicsEndImageContext()

        return resizedImage
    }
}
