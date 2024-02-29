//
//  Item.swift
//  Remider
//
//  Created by Tran Viet Anh on 25/02/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var title: String
    var bodyTile: String
    var status: Bool
    
    init(title: String, bodyTile: String, status: Bool) {
        self.title = title
        self.bodyTile = bodyTile
        self.status = status
    }
}
