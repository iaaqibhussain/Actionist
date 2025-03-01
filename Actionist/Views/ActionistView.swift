//
//  ActionistView.swift
//  Actionist
//
//  Created by Syed Muhammad Aaqib Hussain on 23.02.25.
//

import SwiftUI
import ComposableArchitecture

struct ActionistView: View {
    @Bindable var store: StoreOf<ActionistFeature>
    @State private var newItem: String = ""
    @State private var selectedIndex: Int = -1
    
    var body: some View {
        NavigationView {
            VStack {
                textFieldHeaderView()
                    .padding()
                List {
                    listItemViews(store.items)
                }
            }
            .navigationTitle("Actionist")
            .sheet(
                item: $store.scope(state: \.editState, action: \.updateItem)
            ) { store in
                
                editTodoView(store)
            }
        }
    }
}

// MARK: - Subviews

private extension ActionistView {
    func textFieldHeaderView() -> some View {
        HStack {
            TextField("Enter new item", text: $newItem)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                addItem()
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title)
            }
        }
    }
    
    func listItemViews(_ items: IdentifiedArrayOf<ActionItem>) -> some View {
        ForEach(items.indices, id: \.self) { index in
            let item = items[index]
            listItemView(
                item,
                index
            )
        }
    }
    
    func listItemView(
        _ item: ActionItem,
        _ index: Int
    ) -> some View {
        HStack {
            Text(item.title)
                .strikethrough(item.isCompleted, color: .gray)
            Spacer()
            Button(action: {
                store.send(.isComplete(index))
            }) {
                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(item.isCompleted ? .green : .gray)
            }
        }.swipeActions {
            updateTodoSwipeButton(item, index)
            deleteTodoSwipeButton(index)
        }
    }
    
    func updateTodoSwipeButton(_ item: ActionItem, _ index: Int) -> some View {
        Button(action: {
            selectedIndex = index
            store.send(.updateButtonTapped(item, index))
        }) {
            Label("Update", systemImage: "pencil")
        }
        .tint(.yellow)
    }
    
    func deleteTodoSwipeButton(_ index: Int) -> some View {
        Button(role: .destructive, action: {
            store.send(.remove(index))
        }) {
            Label("Delete", systemImage: "trash")
        }
    }
    
    func editTodoView(_ store: StoreOf<ActionistEditFeature>) -> some View {
        ActionistEditView(
            store: store,
            selectedIndex: $selectedIndex
        )
    }
}

// MARK: - Methods

private extension ActionistView {
    
    func addItem() {
        store.send(.add(newItem))
        newItem = ""
    }
}

#Preview {
    ActionistView(
        store: Store(initialState: ActionistFeature.State()) {
            ActionistFeature()
        }
      )
}
