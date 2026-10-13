//
//  ReservationView.swift
//  LittleLemon
//
//  Created by Əsli Namazova on 08.10.26.
//

import SwiftUI

struct ReservationView: View {
    @EnvironmentObject var model: ReservationModel

    var body: some View {
        VStack(spacing: 0) {
            LittleLemonLogo()
                .padding(.top, 50)

            if let reservation = model.reservation {
                Text("RESERVATION")
                    .font(.title3)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 12)
                    .background(Color.gray.opacity(0.15))
                    .clipShape(Capsule())
                    .padding(.top, 4)

                ReservationDetails(reservation: reservation)
                    .padding(.top, 24)
            } else {
                Text("No Reservation Yet")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.top, 30)
            }

            Spacer()
        }
    }
}

struct ReservationDetails: View {
    let reservation: Reservation

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("RESTAURANT")
            Text(reservation.restaurant.city)
                .font(.title)
                .padding(.top, 20)
            HStack {
                Text(reservation.restaurant.neighborhood)
                Text("–")
                Text(reservation.restaurant.phoneNumber)
            }
            .font(.subheadline)
            .foregroundColor(.gray)

            Divider().padding(.vertical, 20)

            VStack(alignment: .leading, spacing: 4) {
                row("NAME:", reservation.name)
                row("E-MAIL:", reservation.email)
                row("PHONE:", reservation.phone)
            }

            row("PARTY:", "\(reservation.party)")
                .padding(.top, 24)

            VStack(alignment: .leading, spacing: 4) {
                row("DATE:", reservation.date.formatted(date: .long, time: .omitted))
                row("TIME:", reservation.date.formatted(date: .omitted, time: .shortened))
            }
            .padding(.top, 24)

            VStack(alignment: .leading, spacing: 4) {
                Text("SPECIAL REQUESTS:")
                    .foregroundColor(.gray)
                Text(reservation.specialRequests)
            }
            .padding(.top, 24)
        }
        .padding(.horizontal, 24)
    }

    private func row(_ title: String, _ value: String) -> some View {
        HStack {
            Text(title).foregroundColor(.gray)
            Text(value)
        }
        .font(.title3)
    }
}
