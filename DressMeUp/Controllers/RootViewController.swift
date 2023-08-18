//
//  RootViewController.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 03/08/2023.
//

import UIKit
import RxSwift

open class RootViewController: UIViewController {
    
    public let disposebag = DisposeBag()

    open override func viewDidLoad() {
        super.viewDidLoad()
        bindingEvents()
        setupUI()
    }
    
    open func bindingEvents() {}
    
    open func setupUI() {}
}
