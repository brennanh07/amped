//
//  SignUpFormView.swift
//  Amped
//
//  Created by Brennan Humphrey on 1/12/25.
//

import SwiftUI

struct SignUpFormView: View {
    @Binding var email: String
    @Binding var password: String
    @Binding var confirmPassword: String
    let onSubmit: () -> Void
    
    var body: some View {
        VStack (spacing: 10) {
            SignUpTextField(text: $email, prompt: "Email")
                .textContentType(.emailAddress)
            SignUpSecureField(text: $password, prompt: "Password")
                .textContentType(.newPassword)
            SignUpSecureField(text: $confirmPassword, prompt: "Confirm Password")
                .textContentType(.newPassword)
            Button(action: onSubmit) {
                Text("Get Started")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(OnboardingButtonStyle())
        }
        .textFieldStyle(OnboardingTextFieldStyle())
        .padding(.horizontal, 18)
    }
}

#Preview {
    SignUpFormView(
        email: .constant(""),
        password: .constant(""),
        confirmPassword: .constant(""),
        onSubmit: {}
    )
}
