//
//  SignUpViewModel.swift
//  Amped
//
//  Created by Brennan Humphrey on 1/10/25.
//

import Foundation

/**
    Manages the state and business logic for the sign-up process
 
     This view model handles:
     - Form data management
     - Input validation
     - Authentication service interaction
     - Error handling
     
     - Important: Requires proper configuration of authentication services
 */
final class SignUpViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var emailError: EmailValidationError?
    
    enum EmailValidationError: Error {
        case empty
        case invalidFormat
        case alreadyExists
        case unknownError
        
        var message: String {
            switch self {
            case .empty:
                return "Please enter an email address"
            case .invalidFormat:
                return "Please enter a valid email address"
            case .alreadyExists:
                return "An account with this email address already exists"
            case .unknownError:
                return "An unknown error occurred with your email address"
            }
        }
    }
    
    /**
     Validates an email address format against a standard email address format pattern
     
     This validation checks for:
     - Local part containing letters, numbers, and common special characters
     - @ symbol
     - Domain with letters, numbers, dots, and hyphens
     - Top-level domain between 2 - 64 characters
     
     - Parameter email: The email address to validate
     - Returns: `true` if the email matches the expected format, `false` otherwise
     
     - Note: This performs format vlaidation only and does not verify if the email actually exists
     */
    private func isValidEmailFormat(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,64}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    /**
     Validates an email address string according to specified criteria.
     
     This method performs validation checks on the provided email address:
     - Ensures the email is not empty
     - Verifies the email follows a valid format using the `isValidEmailFormat` helper function
     - Checks if the email is already connected to an existing account
     
     - Parameter email: The email address string to validate
     
     - Throws: `EmailValidationError.empty` if the email string is empty
               `EmailValidationError.invalidFormat` if the email string format is invalid
               `EmailValidationError.alreadyExists` if the email is already connected to an existing account
     */
    private func validateEmail(_ email: String) throws {
        guard (!email.isEmpty) else {
            throw EmailValidationError.empty
        }
        
        guard (isValidEmailFormat(email)) else {
            throw EmailValidationError.invalidFormat
        }
        
        // TODO: implement check for already existing email address
    }
    
    /**
     Attemps to register a new user with email and password
     */
    func signUp() {
        // TODO: Implement email/password signup
        
        do {
            try validateEmail(email)
        } catch let error as EmailValidationError {
            self.emailError = error
        } catch {
            self.emailError = .unknownError
        }
    }
    
    /**
     Initiates Google sign-in authentication flow
     */
    func googleSignUp() {
        // TODO: Implement email/password signup with Google
    }
    
    /**
     Initiates Apple sign-in authentication flow
     */
    func appleSignUp() {
        // TODO: Implement email/password signup with Apple
    }
}
