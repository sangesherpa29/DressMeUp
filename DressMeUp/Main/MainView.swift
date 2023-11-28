//
//  MainView.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 25/11/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewmodel = MainViewModel()
    
    var body: some View {
        if viewmodel.isSignedIn, !viewmodel.currentUserId.isEmpty {
            // signed in state
            TabView {
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
            
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}