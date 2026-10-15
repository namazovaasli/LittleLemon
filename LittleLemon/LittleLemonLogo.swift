//
//  LittleLemonLogo.swift
//  LittleLemon
//
//  Created by Əsli Namazova on 08.10.26.
//

import SwiftUI

struct LittleLemonLogo: View {
    var body: some View {
        Image("littleLemonLogo")
            .resizable()
            .scaledToFit()
            .frame(height: 150)
            .padding(.top, 40)
    }
}
