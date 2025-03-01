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
        @Presents var editState: ActionistEditFeature.State?
        var items: IdentifiedArrayOf<ActionItem> = []
        
    }
    
    enum Action {
        case add(String)
        case remove(Int)
        case updateButtonTapped(ActionItem, Int)
        case updateItem(PresentationAction<ActionistEditFeature.Action>)//(Int, String)
        case isComplete(Int)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .add(task):
                let actionItem = ActionItem(title: task)
                state.items.append(actionItem)
                return .none
            case let .remove(index):
                state.items.remove(at: index)
                return .none
            case let .updateButtonTapped(item, index):
                state.editState = ActionistEditFeature.State(item: item, selectedIndex: index)
                return .none

            case let .isComplete(index):
                state.items[index].isCompleted.toggle()
                return .none
            case  .updateItem(.presented(.saveButtonTapped)):
                guard let updateState = state.editState
                else { return .none }
                state.items[updateState.selectedIndex] = updateState.item
                state.editState = nil
                return .none
            case .updateItem:
                return .none
            }
        } .ifLet(\.$editState, action: \.updateItem) {
            ActionistEditFeature()
          }
    }
}
