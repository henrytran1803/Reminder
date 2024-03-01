//
//  User.swift
//  Reminder
//
//  Created by Tran Viet Anh on 01/03/2024.
//

import Foundation
struct UserToken: Codable {
    let user: User
    let id: String
    let value: String
}

struct User: Codable {
    let id: String
}
