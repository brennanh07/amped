//
//  ContentView.swift
//  TestApp
//
//  Created by Brennan Humphrey on 12/27/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        VStack {
            SignUpHeaderView()
            SignUpFormView(
                email: $viewModel.email,
                password: $viewModel.password,
                confirmPassword: $viewModel.confirmPassword,
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

