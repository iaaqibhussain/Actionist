//
//  ActionistFeature.swift
//  Actionist
//
//  Created by Syed Muhammad Aaqib Hussain on 23.02.25.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct ActionistFeature {
    @ObservableState
    struct State {
        var items: [ActionItem] = []
    }
    
    enum Action {
        case add(String)
        case remove(Int)
        case update(Int, String)
        case isComplete(Int)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .add(item):
                let actionItem = ActionItem(title: item)
                state.items.append(actionItem)
                return .none
            case let .remove(index):
                state.items.remove(at: index)
                return .none
            case let .update(index, item):
                state.items[index].title = item
                return .none
            case let .isComplete(index):
                state.items[index].isCompleted.toggle()
                return .none
            }
        }
    }
}
