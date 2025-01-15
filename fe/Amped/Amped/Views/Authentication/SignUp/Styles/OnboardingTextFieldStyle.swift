//
//  OnboardingTextFieldStyle.swift
//  Amped
//
//  Created by Brennan Humphrey on 1/9/25.
//

import SwiftUI

struct OnboardingTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.blue, lineWidth:1))
    }
}

