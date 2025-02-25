//
//  ActionistEditView.swift
//  Actionist
//
//  Created by Syed Muhammad Aaqib Hussain on 25.02.25.
//

import SwiftUI
import ComposableArchitecture

struct ActionistEditView: View {
    let store: StoreOf<ActionistFeature>
    @State private var title: String = ""
    @Binding var selectedIndex: Int
    var dismiss: () -> Void
    
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
                dismiss()
            }
        }
    }
}

    // MARK: - Methods

private extension ActionistEditView {
    
    func onAppear() {
        title = store.items[selectedIndex].title
    }
    
    func saveAction() {
        store.send(.update(selectedIndex, title))
        dismiss()
    }
}
