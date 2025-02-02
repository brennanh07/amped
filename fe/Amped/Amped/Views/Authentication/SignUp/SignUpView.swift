//
//  SignUpView.swift
//  Amped
//
//  Created by Brennan Humphrey on 12/27/24.
//

import SwiftUI

/**
 Main sign-up screen that handles user registration flow
 
 This view coordinates the entire sign-up experience by combining:
 - App branding and message
 - Email/password registration form
 - Social authentication options (Google, Apple)
 - Input validation
 
 ## Key Components
 - `SignUpHeaderView`: Displays the app branding
 - `SignUpFormView`: Handles email/password input
 - `SocialAuthView`: Manages third-party authentication
 
 ## Usage
 ```swift
 SignUpView()
 ```
 
 - Important: Requires properly configured social authentication services
 */
struct SignUpView: View {
    
    /// View model that handles the sign-up business logic and state
    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        VStack {
            SignUpHeaderView()
            SignUpFormView(
                email: $viewModel.email,
                password: $viewModel.password,
                confirmPassword: $viewModel.confirmPassword,
                emailError: viewModel.emailError,
                passwordError: viewModel.passwordError,
                onSubmit: viewModel.signUp
            )
            orDivider()
            SocialAuthView(
                onGoogleAuth: viewModel.googleSignUp,
                onAppleAuth: viewModel.appleSignUp
            )
        }
        .padding()
    }
}

#Preview {
    SignUpView()
}

