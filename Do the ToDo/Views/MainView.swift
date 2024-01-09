//
//  ContentView.swift
//  Do the ToDo
//
//  Created by Yugandhar Khair on 12/24/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel  = MainViewViewModel()
    
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            //signed in
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            TodoListView(userId: viewModel.currentUserId)
                .tabItem { Label("Home", systemImage: "house") }
            
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person.circle") }
        }
    }
}

#Preview {
    MainView()
}
