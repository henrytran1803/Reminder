//
//  User.swift
//  Reminder
//
//  Created by Tran Viet Anh on 01/03/2024.
//

import Foundation
struct UserToken: Codable {
    let status: Bool
    let token: TokenData
    
    struct TokenData: Codable {
        let id: String
        let value: String
        let user: User
        
        struct User: Codable {
            let id: String
        }
    }
}
