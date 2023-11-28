//
//  ChangePasswordViewModel.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 26/11/2023.
//

import Foundation
import FirebaseAuth

class ChangePasswordViewModel: ObservableObject {
    
    @Published var oldPassword = ""
    @Published var newPassword = ""
    @Published var confirmPassword = ""
    @Published var message: String?
    @Published var isPasswordChanged: Bool = false
    
    init() {}
    
    func changePassword() {
        guard let user = Auth.auth().currentUser else {
            // User not signed in
            return
        }
        
        let credential = EmailAuthProvider.credential(withEmail: user.email!, password: oldPassword)
        
        // Reauthenticate user
        user.reauthenticate(with: credential) { [weak self] (result, error) in
            guard let self = self else {return}
            
            if let error = error {
                self.message = error.localizedDescription
                return
            }
            
            // User reauthenticated successfully, now change the password
            user.updatePassword(to: self.newPassword) { error in
                if let error = error {
                    self.message = error.localizedDescription
                    return
                }
                
                // Password changed successfully
                self.oldPassword = ""
                self.newPassword = ""
                self.confirmPassword = ""
                self.isPasswordChanged = true
                self.message = "Password Changed Successful"
            }
        }
    }
}
