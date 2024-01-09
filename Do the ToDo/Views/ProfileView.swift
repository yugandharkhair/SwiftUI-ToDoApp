//
//  ProfileView.swift
//  Do the ToDo
//
//  Created by Yugandhar Khair on 12/24/23.
//

import FirebaseAuth
import FirebaseFirestore
import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    // Avatar
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .frame(width: 125, height: 125)
                        .padding()
                    // Name, Email, Member since
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name: ")
                                .bold()
                            Text(user.name)
                        }
                        .padding(.vertical, 10)
                        
                        HStack {
                            Text("Email: ")
                                .bold()
                            Text(user.email)
                        }
                        
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("Member since:  ")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date:.abbreviated, time: .shortened))")
                        }
                        .padding(.bottom, 10)
                    }
                    
                    
                    // sign out
                    TLButton(title: "Log Out", background: .red) {
                        viewModel.logOut()
                    }
                    .padding()
                    .frame(width: 200, height: 70)
                    
                }
                
                else {
                    Text("Loading Profile..!")
                }
            }
            .navigationTitle("Your Profile")
            
            
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
