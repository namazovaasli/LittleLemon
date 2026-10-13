//
//  Menucategory.swift
//  LittleLemon
//
//  Created by Əsli Namazova on 13.10.26.
//

import Foundation

enum MenuCategory: String, CaseIterable, Identifiable {
    case food = "Food"
    case drink = "Drink"
    case dessert = "Dessert"

    var id: String { rawValue }
}
