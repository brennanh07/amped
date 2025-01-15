//
//  SignUpSecureField.swift
//  Amped
//
//  Created by Brennan Humphrey on 1/14/25.
//

import SwiftUI

struct SignUpSecureField: View {
    @Binding var text: String
    let prompt: String
    
    var body: some View {
        SecureField(prompt, text: $text)
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
    }
}

#Preview {
    VStack(spacing: 20) {
        // Example with empty text
        SignUpSecureField(
            text: .constant(""),
            prompt: "Password"
        )
        .textFieldStyle(OnboardingTextFieldStyle())
        
        // Example with pre-filled text
        SignUpSecureField(
            text: .constant("user@example.com"),
            prompt: "Email"
        )
        .textFieldStyle(OnboardingTextFieldStyle())
    }
    .padding()
}
