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
    @State var showActionSheet = false
    @State var showImagePicker = false
    
    var body: some View {
        ZStack {
            NavigationView {
        //            if let user = viewmodel.user {
                    VStack(alignment: .center, spacing: 20) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.blue, lineWidth: 4))
                            .shadow(radius: 10)
                            .overlay(
                                CameraButtonView(showActionSheet: $showActionSheet)
                                    .offset(x: 35, y: 45)
                            )
                        
                        //                    Text(user.name)
                        //                        .font(.title)
                        //                        .fontWeight(.bold)
                        //
                        //                    Text(user.email)
                        //                        .font(.subheadline)
                        //                        .foregroundColor(.gray)
                        
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
                    .actionSheet(isPresented: $showActionSheet, content: { () -> ActionSheet in
                        ActionSheet(title: Text(""),
                                    message: Text(""),
                                    buttons: [
                                        // Camera
                                        ActionSheet.Button.default(Text("Camera"), action: {
                                            
                                        }),
                                        // Photo Gallery
                                        ActionSheet.Button.default(Text("Gallery"), action: {
                                            self.showImagePicker.toggle()
                                        }),
                                        ActionSheet.Button.cancel()
                                    ])
                    })
                    //            } else {
                    //                Text("Could not find user")
                    //            }
                
                
            }
            
            if showImagePicker {
                ImagePicker(isVisible: $showImagePicker)
            }
        }
        .onAppear {
            viewmodel.fetchUser()
        }
    }
}

struct CameraButtonView: View {
    @Binding var showActionSheet: Bool
    
    var body: some View {
        Button(action: {
            self.showActionSheet.toggle()
        }) {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 45, height: 45)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.black)
                        .overlay(
                            Image(systemName: "camera.fill")
                                .foregroundColor(.white)
                        )
                )
        }
    }
}

#Preview {
    ProfileView()
}
