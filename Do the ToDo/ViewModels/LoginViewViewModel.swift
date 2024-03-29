//
//  LoginViewViewModel.swift
//  Do the ToDo
//
//  Created by Yugandhar Khair on 12/24/23.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        //try to log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all the fields!"
            return false
        }
        
        //emal validation
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email!"
            return false
        }
        
        return true
    }
}
