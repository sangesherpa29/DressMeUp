//
//  Login.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 19/11/2023.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)            
    }
    
    private func validate() -> Bool {
        errMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errMessage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errMessage = "Please enter a valid email"
            return false
        }
        
        guard password.count >= 6 else {
            errMessage = "Password must be greater than 6 characters."
            return false
        }
        
        return true
    }
    
}
