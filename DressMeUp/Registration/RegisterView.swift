//
//  RegisterView.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 25/11/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewmodel = RegisterViewModel()
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
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
                
                TextField("Full Name", text: $name)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Email Address", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
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
