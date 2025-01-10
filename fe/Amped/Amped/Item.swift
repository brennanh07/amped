//
//  Item.swift
//  Amped
//
//  Created by Brennan Humphrey on 1/9/25.
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
