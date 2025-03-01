//
//  ActionItem.swift
//  Actionist
//
//  Created by Syed Muhammad Aaqib Hussain on 25.02.25.
//

import Foundation

struct ActionItem: Identifiable, Codable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}
