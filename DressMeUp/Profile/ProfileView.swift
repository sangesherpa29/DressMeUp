//
//  ProfileView.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 25/11/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewmodel = ProfileViewModel()
    @State var isChangePasswordPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewmodel.user {
                    // Avatar
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                        .frame(width: 125, height: 125)
                        .padding()
                    
                    // Credentials
                    VStack(alignment: .center) {
                        HStack {
                            Text("Name: ").bold()
                            Text(user.name)
                        }
                        .padding()
                        
                        HStack {
                            Text("Email: ").bold()
                            Text(user.email)
                        }
                        .padding()
                        
                        Button("Change Password") {
                            isChangePasswordPresented = true
                        }
                        .foregroundColor(.blue)
                        .bold()
                        .sheet(isPresented: $isChangePasswordPresented) {
                            ChangePasswordView(isPresented: $isChangePasswordPresented)
                        }
                        .padding()
                    }
                    
                    // Signout
                    CustomButtonView(title: "Sign Out",
                                     titleColor: .white,
                                     background: .blue)
                    {
                        viewmodel.signout()
                    }
                    .frame(width: 120, height: 60)
                    
                    Spacer()
                } else {
                    
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewmodel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
