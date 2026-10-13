//
//  Menuitemtests.swift
//  LittleLemon
//
//  Created by Əsli Namazova on 13.10.26.
//

import XCTest
@testable import LittleLemon

final class MenuItemTests: XCTestCase {

    func testMenuItemTitle_whenInitializingWithTitle_expectTitleEqualsInitializedValue() {
        
        let title = "Pasta Primavera"

       
        let menuItem = MenuItem(title: title, ingredients: [])

        
        XCTAssertEqual(menuItem.title, title)
    }

    func testMenuItemIngredients_whenInitializingWithIngredients_expectIngredientsEqualInitializedValue() {
       
        let ingredients: [Ingredient] = [.pasta, .tomatoSauce]

       
        let menuItem = MenuItem(title: "Pasta", ingredients: ingredients)

       
        XCTAssertEqual(menuItem.ingredients, ingredients)
    }
}
