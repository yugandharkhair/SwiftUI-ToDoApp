//
//  User.swift
//  Do the ToDo
//
//  Created by Yugandhar Khair on 12/24/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
