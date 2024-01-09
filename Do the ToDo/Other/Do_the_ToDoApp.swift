//
//  Do_the_ToDoApp.swift
//  Do the ToDo
//
//  Created by Yugandhar Khair on 12/24/23.
//
import FirebaseCore
import SwiftUI

@main
struct Do_the_ToDoApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
