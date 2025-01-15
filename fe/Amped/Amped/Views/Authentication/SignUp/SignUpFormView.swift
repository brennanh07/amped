//
//  SignUpFormView.swift
//  Amped
//
//  Created by Brennan Humphrey on 1/12/25.
//

import SwiftUI

/**
 View that handles email and password input for user registration
 
 - Parameters:
    - email: Binding to the user's email input
    - password: Binding to the user's password input
    - confirmPassword: Binding to the user's password confirmation input
    - onSubmit: Closure called when the form is submitted
 */
struct SignUpFormView: View {
    // MARK: - Properties
    
    @Binding var email: String
    @Binding var password: String
    @Binding var confirmPassword: String
    let onSubmit: () -> Void
    
    // MARK: - View Body
    
    var body: some View {
        VStack (spacing: 10) {
            SignUpTextField(text: $email, prompt: "Email")
                .textContentType(.emailAddress)
                // TODO: Add accessibility functionality
            SignUpSecureField(text: $password, prompt: "Password")
                .textContentType(.newPassword)
                // TODO: Add accessibility functionality
            SignUpSecureField(text: $confirmPassword, prompt: "Confirm Password")
                .textContentType(.newPassword)
                // TODO: Add accessibility functionality
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
