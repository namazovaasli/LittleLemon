//
//  MainView.swift
//  LittleLemon
//
//  Created by Əsli Namazova on 08.10.26.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var model: ReservationModel

    var body: some View {
        TabView(selection: $model.tabViewSelectedIndex) {
            LocationsView()
                .tag(0)
                .tabItem {
                    if !model.displayingReservationForm {
                        Label("Locations", systemImage: "fork.knife")
                    }
                }

            ReservationView()
                .tag(1)
                .tabItem {
                    if !model.displayingReservationForm {
                        Label("Reservation", systemImage: "square.and.pencil")
                    }
                }

            MenuItemsView()
                .tag(2)
                .tabItem {
                    if !model.displayingReservationForm {
                        Label("Menu", systemImage: "list.bullet")
                    }
                }
        }
    }
}
