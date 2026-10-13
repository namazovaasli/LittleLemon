//
//  Menuitemsview.swift
//  LittleLemon
//
//  Created by Əsli Namazova on 13.10.26.
//

import SwiftUI

struct MenuItemsView: View {
    @StateObject private var viewModel = MenuViewViewModel()
    @State private var showingOptions = false

    private let columns = Array(repeating: GridItem(.flexible(), spacing: 6), count: 3)

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(MenuCategory.allCases) { category in
                        if viewModel.selectedCategories.contains(category) {
                            section(for: category)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingOptions = true
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                    .accessibilityLabel("Filter")
                }
            }
            .sheet(isPresented: $showingOptions) {
                MenuItemsOptionView(viewModel: viewModel)
            }
        }
    }

    private func section(for category: MenuCategory) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(category.rawValue)
                .font(.title2)
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(viewModel.items(for: category)) { item in
                    NavigationLink {
                        MenuItemDetailsView(item: item)
                    } label: {
                        VStack(spacing: 4) {
                            Rectangle()
                                .fill(Color.black)
                                .frame(height: 70)
                            Text(item.title)
                                .font(.footnote)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    MenuItemsView()
}
