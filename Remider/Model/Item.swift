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
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
