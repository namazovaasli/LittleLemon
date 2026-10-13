//
//  Menuitem.swift
//  LittleLemon
//
//  Created by Əsli Namazova on 13.10.26.
//

import Foundation

final class MenuItem: MenuItemProtocol, Identifiable {
    let id = UUID()
    let title: String
    let price: Double
    let category: MenuCategory
    var ordersCount: Int
    var ingredients: [Ingredient]

    init(title: String,
         ingredients: [Ingredient],
         price: Double = 0,
         category: MenuCategory = .food,
         ordersCount: Int = 0) {
        self.title = title
        self.ingredients = ingredients
        self.price = price
        self.category = category
        self.ordersCount = ordersCount
    }
}
