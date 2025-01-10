//
//  OnboardingButtonStyle.swift
//  Amped
//
//  Created by Brennan Humphrey on 1/9/25.
//

import SwiftUI

struct OnboardingButtonStyle: ButtonStyle {
    var backgroundColor: Color = Color.blue
    var textColor: Color = Color.white
    var outlineColor: Color? = nil
    var outlineWidth: CGFloat = 0
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(12)
            .font(.system(size: 18, weight: .semibold))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(outlineColor ?? .clear, lineWidth: outlineWidth)
            )
    }
}

