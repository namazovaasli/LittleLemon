//
//  ReservationModel.swift
//  LittleLemon
//
//  Created by Əsli Namazova on 08.10.26.
//

import SwiftUI
import Combine

final class ReservationModel: ObservableObject {
    @Published var restaurants = Restaurant.all
    @Published var tabViewSelectedIndex = 0
    @Published var displayingReservationForm = false
    @Published var reservation: Reservation?
}
