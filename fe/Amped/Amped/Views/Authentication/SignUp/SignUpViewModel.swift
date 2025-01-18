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
    @Published var passwordError: PasswordValidationError?
    
    enum EmailValidationError: Error {
        case empty
        case invalidFormat
        case alreadyExists
        case unknown
        
        var message: String {
            switch self {
            case .empty:
                return "Please enter an email address"
            case .invalidFormat:
                return "Please enter a valid email address"
            case .alreadyExists:
                return "An account with this email address already exists"
            case .unknown:
                return "An unknown error occurred with your email address"
            }
        }
    }
    
    enum PasswordValidationError: Error {
        case empty
        case tooShort
        case missingLowercase
        case missingUppercase
        case missingNumbers
        case missingSpecialCharacters
        case confirmationMismatch
        case unknown
        
        var message: String {
            switch self {
            case .empty:
                return "Please enter a password"
            case .tooShort:
                return "Password must be at least 12 characters long"
            case .missingLowercase:
                return "Password must have at least one lowercase letter"
            case .missingUppercase:
                return "Password must have at least one uppercase letter"
            case .missingNumbers:
                return "Passwors must have at least one number"
            case .missingSpecialCharacters:
                return "Password must have at least one special character"
            case .confirmationMismatch:
                return "Passwords do not match"
            case .unknown:
                return "An unknown error has occurred with your password"
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
     
     - Note: This performs format validation only and does not verify if the email actually exists
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
     Validates a password format against a standard secure password format pattern.
     
     This validation checks for:
     - At least eight characters
     - At least one uppercase letter
     - At least one lowercase letter
     - At least one number
     - At least one special character
     
     - Parameter password: The password string to validate
     
     - Returns: `true` if the password matches the expected format, `false` otherwise
     */
    private func isValidPasswordFormat(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[!@#$%^&*(),.?\":{}|<>])[A-Za-z\\d!@#$%^&*(),.?\":{}|<>]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
    /**
     Validates password requirements and confirms passwords match.
     
     - Parameters:
        - password: The password to validate
        - confirmPassword: The confirmation password to check against
     
     - Throws: `PasswordValidationError.empty` if password string is empty
               `PasswordValidationError.tooShort` if password string is not long enough
               `PasswordValidationError.missingUppercase` if password string does not contain at least one uppercase letter
               `PasswordValidationError.missingLowerCase` if password string does not contain at least one lowercase le
               `PasswordValidationError.missingNumbers` if password string does not contain at least one number
               `PasswordValidationError.missingSpecialCharacters` if password string does not contain at least one special character
     */
    private func validatePassword(_ password: String) throws {
        guard (!password.isEmpty) else {
            throw PasswordValidationError.empty
        }
        
        guard (password.count >= 8) else {
            throw PasswordValidationError.tooShort
        }
        
        guard (password.contains(where: { $0.isUppercase })) else {
            throw PasswordValidationError.missingUppercase
        }
        
        guard (password.contains(where: { $0.isLowercase })) else {
            throw PasswordValidationError.missingLowercase
        }
        
        guard (password.contains(where: { $0.isNumber })) else {
            throw PasswordValidationError.missingNumbers
        }
        
        let specialCharacters = "!@#$%^&*(),.?\":{}|<>"
        guard (password.contains(where: { specialCharacters.contains($0) })) else {
            throw PasswordValidationError.missingSpecialCharacters
        }
    }

    /**
     Attemps to register a new user with email and password
     */
    func signUp() {
        // Reset state
        emailError = nil
        passwordError = nil
        
        do {
            try validateEmail(email)
            try validatePassword(password)
        } catch let error as EmailValidationError {
            self.emailError = error
            return
        } catch let error as PasswordValidationError {
            self.passwordError = error
            return
        } catch {
            return
        }
        
        // TODO: Implement email/password signup
    }
    
    /**
     Initiates Google sign-in authentication flow
     */
    func googleSignUp() {
        // TODO: Implement Google signup
    }
    
    /**
     Initiates Apple sign-in authentication flow
     */
    func appleSignUp() {
        // TODO: Implement Apple signup
    }
}
