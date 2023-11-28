//
//  ChangePasswordView.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 26/11/2023.
//

import SwiftUI

struct ChangePasswordView: View {
    @StateObject var viewmodel = ChangePasswordViewModel()
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            Form {
                if let message = viewmodel.message {
                    Text(message)
                        .foregroundColor(.red)
                }
                
                SecureField("Old Password", text: $viewmodel.oldPassword)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("New Password", text: $viewmodel.newPassword)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Confirm Password", text: $viewmodel.confirmPassword)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                CustomButtonView(title: "Change",
                                 titleColor: .white,
                                 background: .blue)
                {
                    viewmodel.changePassword()
                }
                .padding(.vertical, 10)
                .onChange(of: viewmodel.isPasswordChanged) { isChanged in
                    if isChanged {
                        delay(seconds: 1.2) {
                            isPresented = false
                        }
                    }
                }
            }
            
            Spacer()
                
        }
        .navigationTitle("Change Password")
        .padding()
        
        Spacer()
    }
    
    func delay(seconds: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            closure()
        }
    }
}

#Preview {
    ChangePasswordView(isPresented: .constant(false))
}
