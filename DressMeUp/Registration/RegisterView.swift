//
//  RegisterView.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 25/11/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewmodel = RegisterViewModel()
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register",
                       textColor: .white,
                       background: .orange)
            
            // Login Form
            Form {
                if !viewmodel.errMessage.isEmpty {
                    Text(viewmodel.errMessage)
                        .foregroundColor(.red)
                }
                
                TextField("Full Name", text: $viewmodel.name)
                    .padding(.vertical, 10)
                    .foregroundColor(.black)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                TextField("Email Address", text: $viewmodel.email)
                    .padding(.vertical, 10)
                    .foregroundColor(.black)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                SecureField("Password", text: $viewmodel.password)
                    .padding(.vertical, 10)
                    .foregroundColor(.black)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                CustomButtonView(title: "Register",
                                 titleColor: .white,
                                 background: .blue) 
                {
                    // registration
                    viewmodel.register()
                }
            }
            
        }
    }
}

#Preview {
    RegisterView()
}
