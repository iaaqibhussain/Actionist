//
//  ActionistEditFeature.swift
//  Actionist
//
//  Created by Syed Muhammad Aaqib Hussain on 01.03.25.
//

import ComposableArchitecture

@Reducer
struct ActionistEditFeature {
    @ObservableState
    struct State {
        var item: ActionItem
        var selectedIndex: Int
    }
    
    enum Action {
        case saveButtonTapped
        case cancelButtonTapped
        case update(String)
        case delegate(Delegate)
        enum Delegate {
            case saveItem(ActionItem)
        }
    }
    
    @Dependency(\.dismiss) var dismiss
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .saveButtonTapped:
                return .run { [item = state.item]  send in
                    await send(.delegate(.saveItem(item)))
                    await self.dismiss()
                  }
            case let .update(task):
                state.item.title = task
                return .none
            case .delegate:
                return .none
            case .cancelButtonTapped:
                return .run { _ in await self.dismiss() }
            }
        }
    }
}
