//
//  SocialButton.swift
//  Amped
//
//  Created by Brennan Humphrey on 1/14/25.
//

import SwiftUI

struct SocialButton: View {
    let icon: Image
    let title: String
    let action: () -> Void
    let style: SocialButtonStyle
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                icon
                Spacer()
                Text(title)
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal, 28)
        }
        .buttonStyle(OnboardingButtonStyle(
            backgroundColor: style.backgroundColor,
            textColor: style.textColor,
            outlineColor: style.outline.color,
            outlineWidth: style.outline.width
        ))
    }
}

#Preview {
    SocialButton(
        icon: Image(.appleIcon),
        title: "Social Button",
        action: {},
        style: .apple
    )
    .padding(.horizontal, 18)
}
