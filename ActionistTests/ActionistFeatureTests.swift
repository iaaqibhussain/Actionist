//
//  ActionistTests.swift
//  ActionistTests
//
//  Created by Syed Muhammad Aaqib Hussain on 23.02.25.
//

import ComposableArchitecture
import Foundation
import Testing

@testable import Actionist

@MainActor
struct ActionistFeatureTests {
    
    @Test
    func addItem() async {
        let store = TestStore(initialState: ActionistFeature.State()) {
            ActionistFeature()
           } withDependencies: {
             $0.uuid = .incrementing
           }
        
        await store.send(.add("New Task")) {
            $0.items.append(ActionItem(id: UUID(0), title: "New Task"))
        }
        
        await store.send(.add("New Task 1")) {
            $0.items.append(ActionItem(id: UUID(1), title: "New Task 1"))
        }
    }
}
