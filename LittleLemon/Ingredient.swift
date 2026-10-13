//
//  Ingredient.swift
//  LittleLemon
//
//  Created by Əsli Namazova on 13.10.26.
//

import Foundation

enum Ingredient: String, CaseIterable, Identifiable {
    case spinach = "Spinach"
    case broccoli = "Broccoli"
    case carrot = "Carrot"
    case pasta = "Pasta"
    case tomatoSauce = "Tomato Sauce"

    var id: String { rawValue }
}
