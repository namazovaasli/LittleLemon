//
//  LittleLemonApp.swift
//  LittleLemon
//
//  Created by Əsli Namazova on 08.10.26.
//

import SwiftUI
import Combine
@main
struct LittleLemonApp: App {
    @StateObject private var model = ReservationModel()
    var body: some Scene {
        WindowGroup {
            MainView()
                           .environmentObject(model)
        }
    }
}
