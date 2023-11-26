//
//  ChangePasswordViewModel.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 26/11/2023.
//

import Foundation

class ChangePasswordViewModel: ObservableObject {
    
    @Published var oldPassword = ""
    @Published var newPassword = ""
    @Published var confirmPassword = ""
    
    init() {}
    
    func changePassword() {
        
    }
}
