//
//  LittleLemonLogo.swift
//  LittleLemon
//
//  Created by Əsli Namazova on 08.10.26.
//

import SwiftUI

struct LittleLemonLogo: View {
    var body: some View {
        Image("little_lemon_logo")
            .resizable()
            .scaledToFit()
            .frame(height: 150)
            .padding(.top, 40)
    }
}
