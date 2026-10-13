//
//  Menuviewviewmodel.swift
//  LittleLemon
//
//  Created by Əsli Namazova on 13.10.26.
//

import Foundation
import Combine

final class MenuViewViewModel: ObservableObject {
    @Published var foodMenuItems: [MenuItem] = []
    @Published var drinkMenuItems: [MenuItem] = []
    @Published var dessertMenuItems: [MenuItem] = []

    @Published var selectedCategories: Set<MenuCategory> = Set(MenuCategory.allCases)
    @Published var sortOption: SortOption = .mostPopular

    init() {
        loadMockData()
    }

    
    func items(for category: MenuCategory) -> [MenuItem] {
        let items: [MenuItem]
        switch category {
        case .food: items = foodMenuItems
        case .drink: items = drinkMenuItems
        case .dessert: items = dessertMenuItems
        }
        switch sortOption {
        case .mostPopular: return items.sorted { $0.ordersCount > $1.ordersCount }
        case .price: return items.sorted { $0.price < $1.price }
        case .alphabetical: return items.sorted { $0.title.localizedStandardCompare($1.title) == .orderedAscending }
        }
    }

    func toggle(_ category: MenuCategory) {
        if selectedCategories.contains(category) {
            selectedCategories.remove(category)
        } else {
            selectedCategories.insert(category)
        }
    }

    

    private func loadMockData() {
        foodMenuItems = makeItems(count: 12, title: "Food", category: .food)
        drinkMenuItems = makeItems(count: 8, title: "Drink", category: .drink)
        dessertMenuItems = makeItems(count: 4, title: "Dessert", category: .dessert)
    }

    private func makeItems(count: Int, title: String, category: MenuCategory) -> [MenuItem] {
        let all = Ingredient.allCases
        return (1...count).map { index in
           
            let ingredients = (0..<(2 + index % 2)).map { all[(index + $0) % all.count] }
            return MenuItem(title: "\(title) \(index)",
                            ingredients: ingredients,
                            price: 5 + Double(index) * 1.5 + 0.49,
                            category: category,
                            ordersCount: (index * 137) % 1000 + 100)
        }
    }
}
