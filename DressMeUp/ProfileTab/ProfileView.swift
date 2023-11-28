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
    @State var signoutConfirmation = false
    
    var body: some View {
        NavigationView {
            if let user = viewmodel.user {
                VStack(alignment: .center, spacing: 20) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.blue, lineWidth: 4))
                        .shadow(radius: 10)
                    
                    Text(user.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(user.email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    CustomButtonView(title: "Change Password",
                                     titleColor: .white,
                                     background: .blue)
                    {
                        isChangePasswordPresented = true
                    }
                    .sheet(isPresented: $isChangePasswordPresented) {
                        ChangePasswordView(isPresented: $isChangePasswordPresented)
                    }
                    
                    Button(action: {
                        signoutConfirmation = true
                    }) {
                        Text("Sign Out")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.pink)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    
                    Spacer()
                }
                .padding(20)
                .navigationTitle("Profile")
                .alert(isPresented: $signoutConfirmation) {
                    Alert(title: Text("Are you sure you want to sign out?"),
                          message: Text(""),
                          primaryButton: .default(Text("Ok")) { viewmodel.signout() },
                          secondaryButton: .cancel())
                }
            } else {
                Text("Could not find user")
            }
        }
        .onAppear {
            viewmodel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
