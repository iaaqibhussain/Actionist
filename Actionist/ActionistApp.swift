//
//  ActionistApp.swift
//  Actionist
//
//  Created by Syed Muhammad Aaqib Hussain on 23.02.25.
//

import SwiftUI
import ComposableArchitecture

@main
struct ActionistApp: App {
    var body: some Scene {
        WindowGroup {
            ActionistView(
                store: Store(initialState: ActionistFeature.State()) {
                    ActionistFeature()
                }
            )
        }
    }
}
