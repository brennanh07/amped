//
//  SignUpHeaderView.swift
//  Amped
//
//  Created by Brennan Humphrey on 1/12/25.
//

import SwiftUI

struct SignUpHeaderView: View {
    var body: some View {
        VStack {
            Image(.ampedIcon)
                .padding(.bottom, -12)
            Text("Amped")
                .font(.system(size: 64, weight: .bold))
            Text("Supercharge Your Training")
                .font(.system(size: 24, weight: .bold))
                .padding(.bottom)
        }
    }
}


