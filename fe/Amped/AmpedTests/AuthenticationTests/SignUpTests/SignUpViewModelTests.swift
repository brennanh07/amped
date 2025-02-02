//
//  SignUpViewModelTests.swift
//  AmpedTests
//
//  Created by Brennan Humphrey on 1/16/25.
//

import XCTest
@testable import Amped

/**
 Test suite for the SignUpViewModel functionality.
 
 This test class verifies the behavior of the SignUpViewModel, which manages the sign-up
 process for new users in the Amped application.
 
 The tests cover various aspects of user input validation and authentication flow.
 
 ## Test Coverage
 1. Email Validation
 - Valid email address formats
 - Invalid email address formats
 - Empty email address handling
 
 */
final class SignUpViewModelTests: XCTestCase {
    private var signUpViewModel: SignUpViewModel!
    
    /**
     Sets up the test environment before each test method.
     
     This method is called before the invocation of each test method in the class.
     
     It initializes a fresh instance of SignUpViewModel to ensure each test starts with a clean slate.
     */
    override func setUp() {
        super.setUp()
        signUpViewModel = SignUpViewModel()
    }
    
    /**
     Tears down the test environment after each test method
     
     This method is called after the invocation of each test method in the class.
     
     It releases the SignUpViewModel instance to prevent any state from leaking between tests.
     */
    override func tearDown() {
        signUpViewModel = nil
        super.tearDown()
    }
    
    /**
     Tests valid email address format validation during signup.
     
     This test verifies that the SignUpViewModel correctly validates a wide range of properly
     formatted email addresses that match the regex pattern specified.
     
     The test iterates through an array of valid email address formats and ensures that
     each one passes validation without errors.
     
     ## Test cases include:
     - Basic email formats
     - Emails with special characters
     - Emails with numbers
     - Mixed case emails
     - Subdomain emails
     - Various common TLDs
     
     ## Expected Outcomes
     - Each email should result in `nil` emailError when validated
     
     - Note: This test only verifies format validation, not actual email existence
     */
    func testSignUpValidEmailFormat() {
        
        // Given: Collecton of valid email addresses
        let validEmails = [
            "simple@example.com",
            "very.common@example.com",
            "email.with.dots@example.com",
            "email-with-hyphen@example.com",
            "numbers123@example.com",
            "dots.and.numbers.123@example.com",
            "percentage%sign@example.com",
            "plus+sign@example.com",
            "underscore_sign@example.com",
            "mixed.UPPER.lower@example.com",
            "single@letter.com",
            "numbered123domain@numbered456.com",
            "email@subdomain.example.com",
            "mixed-dots.and-hyphens@complex-domain.com",
            "mixed.case.email@Mixed.Case.com",
            "short@ex.com",
            "x@example.com",
            "test.email@example.co.uk",
            "number.one@domain.two.com",
            "first.last@example.com",
            "newsletter@daily-news.com",
            "support@tech-help.com",
            "contact@small.business.com",
            "info@company-name.com",
            "sales@enterprise.com",
            "admin@system.com",
            "user@host.com",
            "email@domain.com",
            "name@website.com",
            "account@service.com"
        ]
        
        let validPassword = "ValidP@ssword123"
        
        for email in validEmails {
            
            // When: Attempting to sign up with a valid email
            signUpViewModel.email = email
            signUpViewModel.password = validPassword
            signUpViewModel.confirmPassword = validPassword
            
            // Then: No email validation errors should be present
            XCTAssertNil(signUpViewModel.emailError, "\(email) is not a valid email")
        }
        
    }
    
    /**
     Tests invalid email address format rejection during signup.
     
     This test ensures that the SignUpViewModel properly identifies and rejects improperly formatted
     email addresses, according to the specified regex pattern.
     
     The test validates that each invalid email address format triggers ther appropriate validation error.
     
     ## Test cases include:
     - Missing @ symbol
     - Multiple @ symbols
     - Invalid characters
     - Malformed domains
     - Missing TLD
     - Invalid TLD formats
     - Leading/trailing special characters
     
     ## Expected Outcomes
     - Each invalid email should set emailError to .invalidFormat
     - Error message should be "Please enter a valid email address"
     */
    func testSignUpInvalidEmailFormat() {
        
        // Given: Collection of invalid email addresses
        let invalidEmails = [
            // Local Part Issues (before @)
            "plainaddress",                    // Missing @ symbol completely
            "@domain.com",                     // Missing local part
            "..double.dots@domain.com",        // Consecutive dots not allowed
            ".start.with.dot@domain.com",      // Can't start with dot
            "end.with.dot.@domain.com",        // Can't end with dot
            "spaces in local@domain.com",      // Spaces not allowed without quotes
            "\"quotes\"outside\"@domain.com",  // Quotes must encapsulate entire local part
            
            // Domain Part Issues (after @)
            "email@",                          // Missing domain completely
            "email@.com",                      // Domain can't start with dot
            "email@domain",                    // Missing top-level domain
            "email@-domain.com",               // Domain can't start with hyphen
            "email@domain-.com",               // Domain can't end with hyphen
            "email@domain..com",               // Consecutive dots not allowed in domain
            
            // Multiple @ Symbols
            "email@domain@domain.com",         // Multiple @ symbols not allowed
            "email@@domain.com",               // Consecutive @ symbols not allowed
            
            // Length Issues
            String(repeating: "a", count: 65) + "@domain.com",  // Local part > 64 chars
            
            // Special Character Issues
            "email@domain#.com",               // Invalid characters in domain
            "email@[12.345.678.900]",         // Invalid IP format
            "email@[IPv6:1::2::3]",           // Invalid IPv6 format
            
            // Encoding Issues
            "email@ドメイン.com",               // Non-ASCII in domain (without IDNA encoding)
            "☃@domain.com",                    // Non-ASCII in local part
            
            // Common Typos
            "email@.domain.com",               // Extra dot after @
            "email@domain..com",               // Double dots
            "email@domain.com.",               // Trailing dot
            
            // Missing or Malformed Parts
            "email@.domain.com",               // Domain starts with dot
            "email@domain.com-",               // Domain ends with hyphen
            
            // Whitespace Issues
            " email@domain.com",               // Leading whitespace
            "email@domain.com ",               // Trailing whitespace
            "em ail@domain.com",              // Space in local part without quotes
            "email@dom ain.com"
        ]
        
        let validPassword = "ValidP@ssword123"
        
        for (index, email) in invalidEmails.enumerated() {
            // When: Attempting to sign up with an invalid email
            signUpViewModel.email = email
            signUpViewModel.password = validPassword
            signUpViewModel.confirmPassword = validPassword
            
            // Then: Should receive invalid format error
            XCTAssertEqual(
                signUpViewModel.emailError,
                .invalidFormat,
                    """
                    Expected invalid format error for email #\(index + 1):
                    "\(email)"
                    Description: \(invalidEmails[index].components(separatedBy: " // ").last ?? "No description")
                    """
            )
            
            XCTAssertEqual(
                signUpViewModel.emailError?.message,
                "Please enter a valid email address",
                    """
                    Expected error message mismatch for email #\(index + 1):
                    "\(email)"
                    Description: \(invalidEmails[index].components(separatedBy: " // ").last ?? "No description")
                    """
            )
        }
        
    }
    
    /**
     Tests empty email address validation during signup.
     
     This test verifies that the SignUpViewModel properly handles and validates
     attemps to signup with an empty email address string.
     
     ## Expected Outcomes
     - Should set emailError to .empty
     - Error message should be "Please enter an email address:
     
     - Note: This test specifically handles the empty string case, not null or whitespace-only cases
     */
    func testSignUpEmptyEmail() {
        
        // Given: Empty email address string
        let validPassword = "ValidP@ssword123"
        
        // When: Attempting to signup
        signUpViewModel.email = ""
        signUpViewModel.password = validPassword
        signUpViewModel.confirmPassword = validPassword
        
        // Then: Should receive empty email error
        XCTAssertEqual(signUpViewModel.emailError, .empty)
        XCTAssertEqual(signUpViewModel.emailError?.message, "Please enter an email address")
    }
    
}
