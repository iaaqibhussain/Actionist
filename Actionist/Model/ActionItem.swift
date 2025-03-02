//
//  ActionItem.swift
//  Actionist
//
//  Created by Syed Muhammad Aaqib Hussain on 25.02.25.
//

import Foundation

struct ActionItem: Identifiable, Equatable {
    let id: UUID
    var title: String
    var isCompleted: Bool = false
    
    init(
        id: UUID = UUID(),
        title: String,
        isCompleted: Bool = false
    ) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}
