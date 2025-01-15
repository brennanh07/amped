//
//  SwiftUIView.swift
//  Amped
//
//  Created by Brennan Humphrey on 1/12/25.
//

import SwiftUI

struct SignUpTextField: View {
    @Binding var text: String
    let prompt: String
    
    var body: some View {
        TextField(prompt, text: $text)
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
    }
}

#Preview {
    VStack(spacing: 20) {
        // Example with empty text
        SignUpTextField(
            text: .constant(""),
            prompt: "Email"
        )
        .textFieldStyle(OnboardingTextFieldStyle())
        
        // Example with pre-filled text
        SignUpTextField(
            text: .constant("user@example.com"),
            prompt: "Email"
        )
        .textFieldStyle(OnboardingTextFieldStyle())
    }
    .padding()
}
