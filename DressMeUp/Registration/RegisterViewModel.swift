//
//  RegisterViewModel.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 25/11/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel : ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errMessage = ""
    
    init() {}
    
    func register() {
        guard validate() else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertRecord(id: userId)
        }
    }
    
    
    private func validate() -> Bool {
        errMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
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
    
    
    private func insertRecord(id: String) {
        let user = User(id: id,
                        name: name,
                        email: email,
                        joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(user.asDictionary())
    }
}
