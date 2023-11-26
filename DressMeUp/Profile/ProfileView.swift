//
//  ProfileView.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 25/11/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewmodel = ProfileViewModel()
    
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
                        
                        NavigationLink("Change Password", 
                                       destination: ChangePasswordView())
                            .foregroundColor(.pink)
                            .bold()
                    }
                    
                    // Signout
                    CustomButtonView(title: "Sign Out",
                                     titleColor: .white,
                                     background: .blue)
                    {
                        viewmodel.signout()
                    }
                    .frame(width: 100, height: 50)
                    
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
