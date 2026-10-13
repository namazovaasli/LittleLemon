//
//  Menuitemprotocol.swift
//  LittleLemon
//
//  Created by Əsli Namazova on 13.10.26.
//

import Foundation

protocol MenuItemProtocol {
    var id: UUID { get }
    var price: Double { get }
    var title: String { get }
    var category: MenuCategory { get }
    var ordersCount: Int { get set }
    var ingredients: [Ingredient] { get set }
}
