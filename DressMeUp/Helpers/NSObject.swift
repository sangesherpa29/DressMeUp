//
//  NSObject.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 12/07/2023.
//

import Foundation
import UIKit
import RxDataSources

protocol HasApply { }

extension HasApply {
    @discardableResult
    func apply(_ closure: (_ it :  Self) -> ()) -> Self {
        closure(self)
        return self
    }
}


extension NSObject: HasApply { }
