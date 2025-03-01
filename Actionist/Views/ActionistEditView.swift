//
//  ActionistEditView.swift
//  Actionist
//
//  Created by Syed Muhammad Aaqib Hussain on 25.02.25.
//

import SwiftUI
import ComposableArchitecture

struct ActionistEditView: View {
    @Bindable var store: StoreOf<ActionistEditFeature>
    @State private var title: String = ""
    @Binding var selectedIndex: Int
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Edit Item", text: $title)
            }
            .navigationTitle("Edit Item")
            .toolbar {
                saveToolbarItem()
                cancelToolbarItem()
            }
        }.onAppear {
            onAppear()
        }
    }
}

    // MARK: - Subviews

private extension ActionistEditView {
    
    func saveToolbarItem() -> some ToolbarContent {
        ToolbarItem(placement: .confirmationAction) {
            Button("Save") {
                saveAction()
            }
        }
    }
    
    func cancelToolbarItem() -> some ToolbarContent {
        ToolbarItem(placement: .cancellationAction) {
            Button("Cancel") {
                store.send(.cancelButtonTapped)
            }
        }
    }
}

    // MARK: - Methods

private extension ActionistEditView {
    
    func onAppear() {
       title = store.item.title
    }
    
    func saveAction() {
        store.send(.update(title))
        store.send(.saveButtonTapped)
    }
}
