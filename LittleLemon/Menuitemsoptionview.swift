//
//  Menuitemsoptionview.swift
//  LittleLemon
//
//  Created by Əsli Namazova on 13.10.26.
//

import SwiftUI

struct MenuItemsOptionView: View {
    @ObservedObject var viewModel: MenuViewViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(MenuCategory.allCases) { category in
                        Button {
                            viewModel.toggle(category)
                        } label: {
                            row(category.rawValue,
                                selected: viewModel.selectedCategories.contains(category))
                        }
                    }
                } header: {
                    Text("SELECTED CATEGORIES")
                }

                Section {
                    ForEach(SortOption.allCases) { option in
                        Button {
                            viewModel.sortOption = option
                        } label: {
                            row(option.rawValue, selected: viewModel.sortOption == option)
                        }
                    }
                } header: {
                    Text("SORT BY")
                }
            }
            .navigationTitle("Filter")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }

    private func row(_ title: String, selected: Bool) -> some View {
        HStack {
            Text(title).foregroundStyle(.primary)
            Spacer()
            if selected {
                Image(systemName: "checkmark").foregroundStyle(.blue)
            }
        }
    }
}

#Preview {
    MenuItemsOptionView(viewModel: MenuViewViewModel())
}
