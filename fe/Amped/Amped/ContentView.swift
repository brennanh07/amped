//
//  ContentView.swift
//  TestApp
//
//  Created by Brennan Humphrey on 12/27/24.
//

import SwiftUI

struct OnboardingView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    var body: some View {
        VStack {
            Image(.ampedIcon)
                .padding(.bottom, -12)
            Text("Amped")
                .font(.system(size: 64, weight: .bold, design: .default))
            Text("Supercharge Your Training")
                .font(.system(size: 24, weight: .bold, design: .default))
                .padding(.bottom)
            TextField("Email", text: $email)
                .disableAutocorrection(true)
                .padding(.bottom, 5)
                .padding(.horizontal, 18)
            SecureField("Password", text: $password)
                .disableAutocorrection(true)
                .padding(.bottom, 5)
                .padding(.horizontal, 18)
            SecureField("Confirm Password", text: $confirmPassword)
                .disableAutocorrection(true)
                .padding(.bottom, 5)
                .padding(.horizontal, 18)
            Button(action: signUp) {
                Text("Get Started")
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 18)
            HStack {
                VStack {
                    Divider()
                        .frame(height: 1)
                        .background(Color.gray)
                        .padding(.horizontal, 18)
                }
                Text("or")
                VStack {
                    Divider()
                        .frame(height: 1)
                        .background(Color.gray)
                        .padding(.horizontal, 18)
                    
                }
                
            }
            
            Button(action: signUp) {
                HStack(spacing: -20) {
                    Image(.googleIcon)
                    Text("Continue with Google")
                        .frame(maxWidth: .infinity)
                }
            }
            .buttonStyle(OnboardingButtonStyle(
                backgroundColor: .white,
                textColor: .black,
                outlineColor: .gray,
                outlineWidth: 1
            ))
            .padding(.horizontal, 18)
            .padding(.bottom, 5)
            Button(action: signUp) {
                HStack(spacing: -16) {
                    Image(.appleIcon)
                    Text("Continue with Apple")
                        .frame(maxWidth: .infinity)
                }
            }
            .buttonStyle(OnboardingButtonStyle(
                backgroundColor: .black,
                textColor: .white
            ))
            .padding(.horizontal, 18)
        }
        .textFieldStyle(OnboardingTextFieldStyle())
        .buttonStyle(OnboardingButtonStyle())
        .padding()
        .textInputAutocapitalization(.never)
    }
}

private func signUp() {
    // Signup logic
}

#Preview {
    OnboardingView()
}

