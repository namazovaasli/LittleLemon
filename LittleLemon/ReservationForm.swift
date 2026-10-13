//
//  ReservationForm.swift
//  LittleLemon
//
//  Created by Əsli Namazova on 08.10.26.
//


import SwiftUI

struct ReservationForm: View {
    private let restaurant: Restaurant

    @EnvironmentObject var model: ReservationModel
    @Environment(\.dismiss) private var dismiss

    @State private var party = 1
    @State private var date = Date()
    @State private var time = Date()
    @State private var name = ""
    @State private var phone = ""
    @State private var email = ""
    @State private var specialRequest = ""

    @State private var showFormInvalidMessage = false
    @State private var errorMessage = ""

    init(_ restaurant: Restaurant) {
        self.restaurant = restaurant
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {

                VStack(alignment: .leading, spacing: 4) {
                    Text(restaurant.city).font(.title)
                    HStack {
                        Text(restaurant.neighborhood)
                        Text("–")
                        Text(restaurant.phoneNumber)
                    }
                    .font(.subheadline)
                    .foregroundColor(.gray)
                }
                .padding(.bottom, 12)

                Divider()

                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("PARTY")
                        TextField("",
                                  value: $party,
                                  formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .onChange(of: party) { _, value in
                                if value <= 0 { party = 1 }
                            }
                            .frame(width: 60)
                    }
                    Spacer()
                    DatePicker("", selection: $date, displayedComponents: .date)
                        .labelsHidden()
                    DatePicker("", selection: $time, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                .padding(.vertical, 24)

                Divider()

                fieldRow("NAME:", "Your name...", $name)
                Divider()
                fieldRow("PHONE:", "Your phone number...", $phone)
                    .keyboardType(.phonePad)
                Divider()
                fieldRow("E-MAIL:", "Your e-mail...", $email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                Divider()

                TextField("add any special request (optional)", text: $specialRequest)
                    .padding(.horizontal, 28)
                    .padding(.vertical, 22)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.gray.opacity(0.25), lineWidth: 1)
                    )
                    .padding(.vertical, 24)

                Divider()

                Button(action: {
                    validateForm()
                }, label: {
                    Text("CONFIRM RESERVATION")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(.horizontal, 28)
                        .padding(.vertical, 16)
                        .background(Color.blue)
                        .clipShape(Capsule())
                })
                .padding(.top, 24)
            }
            .padding(.horizontal, 24)
        }
        .onAppear { model.displayingReservationForm = true }
        .onDisappear { model.displayingReservationForm = false }
        .alert("ERROR", isPresented: $showFormInvalidMessage, actions: {
            Button("OK", role: .cancel) { }
        }, message: {
            Text(self.errorMessage)
        })
    }

    private func fieldRow(_ title: String, _ placeholder: String, _ text: Binding<String>) -> some View {
        HStack {
            Text(title)
            TextField(placeholder, text: text)
        }
        .padding(.vertical, 16)
    }

  

    private func validateForm() {
        var errors: [String] = []

        let trimmedName = name.trimmingCharacters(in: .whitespaces)
        if trimmedName.count < 3 || !trimmedName.allSatisfy({ $0.isLetter || $0 == " " }) {
            errors.append("Names can only contain letters and must have at least 3 characters")
        }
        if phone.trimmingCharacters(in: .whitespaces).isEmpty {
            errors.append("The phone number cannot be blank.")
        }
        let emailPattern = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        if email.range(of: emailPattern, options: .regularExpression) == nil {
            errors.append("The e-mail is invalid and cannot be blank.")
        }

        guard errors.isEmpty else {
            errorMessage = "Found these errors in the form:\n\n" + errors.joined(separator: "\n\n")
            showFormInvalidMessage = true
            return
        }

        
        let calendar = Calendar.current
        let parts = calendar.dateComponents([.hour, .minute], from: time)
        let fullDate = calendar.date(bySettingHour: parts.hour ?? 0,
                                     minute: parts.minute ?? 0,
                                     second: 0,
                                     of: date) ?? date

        model.reservation = Reservation(restaurant: restaurant,
                                        name: trimmedName,
                                        email: email,
                                        phone: phone,
                                        party: party,
                                        date: fullDate,
                                        specialRequests: specialRequest)

        model.tabViewSelectedIndex = 1
        dismiss()
    }
}
