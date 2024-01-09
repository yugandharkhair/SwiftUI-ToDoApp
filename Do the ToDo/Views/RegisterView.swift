//
//  RegisterView.swift
//  Do the ToDo
//
//  Created by Yugandhar Khair on 12/24/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            //header
            HeaderView(title: "Register", subtitle: "Start the change!", angle: 15, background: .orange)
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                
                SecureField("Create Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create Account",
                         background: Color.orange
                ) {
                    viewModel.register()
                }
                .padding()
            }
            .offset(y: -50)
            .background(Color(UIColor.systemBackground))
            .scrollContentBackground(.hidden)
            
            
            Spacer()
        }

    }
}

#Preview {
    RegisterView()
}
