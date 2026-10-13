//
//  LocationsView.swift
//  LittleLemon
//
//  Created by Əsli Namazova on 08.10.26.
//


import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var model: ReservationModel

    var body: some View {
        VStack {
            LittleLemonLogo()
                .padding(.top, 50)

            Text(model.displayingReservationForm ? "Reservation Details" :
                    "Select a location")
                .padding([.leading, .trailing], 40)
                .padding([.top, .bottom], 8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)

            NavigationView {
                List(model.restaurants, id: \.self) { restaurant in
                    NavigationLink(destination: ReservationForm(restaurant)) {
                        RestaurantView(restaurant)
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
    }
}
