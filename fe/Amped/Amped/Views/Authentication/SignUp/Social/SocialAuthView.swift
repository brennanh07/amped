//
//  SocialAuthView.swift
//  Amped
//
//  Created by Brennan Humphrey on 1/14/25.
//

import SwiftUI

struct SocialAuthView: View {
    let onGoogleAuth: () -> Void
    let onAppleAuth: () -> Void
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        VStack (spacing: 10) {
            SocialButton(
                icon: Image(.googleIcon),
                title: "Continue with Google",
                action: onGoogleAuth,
                style: .google
            )
            
            SocialButton(
                icon: colorScheme == .dark ? Image(.appleLogo1) : Image(.appleIcon),
                title: "Continue with Apple",
                action: onAppleAuth,
                style: .apple
            )
        }
        .padding(.horizontal, 18)
    }
}

#Preview {
    SocialAuthView(
        onGoogleAuth: {},
        onAppleAuth: {}
    )
}
