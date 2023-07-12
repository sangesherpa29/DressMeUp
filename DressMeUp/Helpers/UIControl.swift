//
//  UIControl.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 12/07/2023.
//

import Foundation
import UIKit

class ClosureSleeve {
    let closure: () -> ()
    
    init(attachTo: AnyObject, closure: @escaping () -> ()) {
        self.closure = closure
        objc_setAssociatedObject(attachTo, "[\(arc4random())]", self, .OBJC_ASSOCIATION_RETAIN)
    }
    
    @objc func invoke() {
        closure()
    }
}

extension UIView {
    func addOnClickListner(action: @escaping () -> ()) {
        let sleeve = ClosureSleeve(attachTo: self, closure: action)
        isUserInteractionEnabled = true
        
        if(self is UIButton){
            (self as! UIButton).addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: .touchUpInside)
        }else{
            
            let singleTap = UITapGestureRecognizer(target: sleeve, action: #selector(ClosureSleeve.invoke))
            self.isUserInteractionEnabled = true
            self.addGestureRecognizer(singleTap)
        }
    }
}
