//
//  Menuitemdetailsview.swift
//  LittleLemon
//
//  Created by Əsli Namazova on 13.10.26.
//

import SwiftUI

struct MenuItemDetailsView: View {
    let item: MenuItem

    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                Image("littleLemonLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 360)

                detail("Price:", String(format: "%.2f", item.price))
                detail("Ordered:", item.ordersCount.formatted())

                Text("Ingredients:").bold()
                ForEach(item.ingredients) { ingredient in
                    Text(ingredient.rawValue)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
        }
        .navigationTitle(item.title)
        .navigationBarTitleDisplayMode(.large)
    }

    private func detail(_ label: String, _ value: String) -> some View {
        VStack(spacing: 2) {
            Text(label).bold()
            Text(value)
        }
    }
}

#Preview {
    NavigationStack {
        MenuItemDetailsView(item: MenuItem(title: "Food 5",
                                           ingredients: [.spinach, .broccoli, .carrot, .pasta],
                                           price: 10.99,
                                           ordersCount: 1000))
    }
}
