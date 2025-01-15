//
//  SignUpViewModel.swift
//  Amped
//
//  Created by Brennan Humphrey on 1/10/25.
//

import Foundation

final class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    func signUp() {
        // TODO: Implement email/password signup
    }
    
    func googleSignUp() {
        // TODO: Implement email/password signup with Google
    }
    
    func appleSignUp() {
        // TODO: Implement email/password signup with Apple
    }
}
