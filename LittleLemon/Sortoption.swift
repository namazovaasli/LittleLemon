//
//  Sortoption.swift
//  LittleLemon
//
//  Created by Əsli Namazova on 13.10.26.
//

import Foundation

enum SortOption: String, CaseIterable, Identifiable {
    case mostPopular = "Most Popular"
    case price = "Price $-$$$"
    case alphabetical = "A-Z"

    var id: String { rawValue }
}
