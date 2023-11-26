//
//  ChangePasswordView.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 26/11/2023.
//

import SwiftUI

struct ChangePasswordView: View {
    @StateObject var viewmodel = ChangePasswordViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            Form {
                TextField("Old Password", text: $viewmodel.oldPassword)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("New Password", text: $viewmodel.newPassword)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Confirm Password", text: $viewmodel.confirmPassword)
                    .textFieldStyle(DefaultTextFieldStyle())
            }
            
            Spacer()
                
        }
        .navigationTitle("Change Password")
        .padding()
        
        Spacer()
    }
}

#Preview {
    ChangePasswordView()
}
