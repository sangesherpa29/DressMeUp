//
//  LoginView.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 25/11/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewmodel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "Dress Me Up",
                           textColor: .white,
                           background: .pink)
                
                // Login Form
                Form {
                    if !viewmodel.errMessage.isEmpty {
                        Text(viewmodel.errMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewmodel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewmodel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    CustomButtonView(title: "Log In",
                                     titleColor: .white,
                                     background: .blue)
                    {
                        // try logging in
                        viewmodel.login()
                    }
                }
                
                // Create Account
                
                VStack {
                    NavigationLink(destination: RegisterView()) {
                        Text("Create an account")
                    }
                }
            }
        } // navigationView
    }
}

#Preview {
    LoginView()
}
