//
//  LoginView.swift
//  Do the ToDo
//
//  Created by Yugandhar Khair on 12/24/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                //header
                HeaderView(title: "Do the To-Do", subtitle: "Check that thing off!", angle: -15, background: .blue)
                
                //loding form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()

                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    
                    TLButton(title: "Log in", 
                             background: Color.blue
                    ) {
                        //Attemp login
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y:-70)
                .background(Color(UIColor.systemBackground))
                .scrollContentBackground(.hidden)
            
                
                //create account
                VStack {
                    Text("Using for the first time?")
                        .padding(.bottom, 2)
                        .bold()
                    NavigationLink("Create New Account", destination: RegisterView())
                }
                .padding(.bottom, 40)
                
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    LoginView()
}
