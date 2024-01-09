//
//  ToDoListItem.swift
//  Do the ToDo
//
//  Created by Yugandhar Khair on 12/24/23.
//

import Foundation


struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
