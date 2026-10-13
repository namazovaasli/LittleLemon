//
//  RestaurantView.swift
//  LittleLemon
//
//  Created by Əsli Namazova on 08.10.26.
//

import SwiftUI

struct RestaurantView: View {
    private let restaurant: Restaurant

    init(_ restaurant: Restaurant) {
        self.restaurant = restaurant
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(restaurant.city)
                .font(.title2)
            HStack {
                Text(restaurant.neighborhood)
                Text("–")
                Text(restaurant.phoneNumber)
            }
            .font(.subheadline)
            .foregroundColor(.gray)
        }
        .padding(.vertical, 6)
    }
}
