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
        
        for email in validEmails {
            
            // When: Attempting to sign up with a valid email
            signUpViewModel.email = email
            signUpViewModel.signUp()
            
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
            "plainaddress",
            "#@%^%#$@#$@#.com",
            "@example.com",
            "Joe Smith <email@example.com>",
            "email.example.com",
            "email@example@example.com",
            ".email@example.com",
            "email.@example.com",
            "email..email@example.com",
            "email@example.com (Joe Smith)",
            "email@example",
            "email@-example.com",
            "email@example..com",
            "email@.com",
            "email@example.web",
            "email@111.222.333.44444",
            "email@example..com",
            "Abc..123@example.com",
            "email@123.123.123.123",
            "email@[123.123.123.123]",
            "email@example.c",
            "email@example.photography123",
            "email@example.123",
            "email@example",
            "email.example@example",
            "email@example@example.com",
            "email@example.com@example.com",
            "email@example.com.",
            "email@example.com..",
            "email@example.com...",
            "email@@example.com",
            "email.@example.com",
            "email..test@example.com",
            ".email@example.com",
            "email@.example.com",
            "email@example-.com",
            "email@-example.com",
            "email@example.com-",
            "email@example._com",
            "email@example.com_",
            "email@example.c0m",
            "email@example.c_m",
            "email@[123.123.123.123]",
            "user@[IPv6:2001:db8::1]",
            "email@[IPv6:2001:db8:1]",
        ]
        
        for email in invalidEmails {
            
            // When: Attempting to signup with an invalid email
            signUpViewModel.email = email
            signUpViewModel.signUp()
            
            // Then: Should revceive invalid format error
            XCTAssertEqual(signUpViewModel.emailError, .isInvalidFormat)
            XCTAssertEqual(signUpViewModel.emailError?.message, "Please enter a valid email address")
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
        signUpViewModel.email = ""
        
        // When: Attempting to signup
        signUpViewModel.signUp()
        
        // Then: Should receive empty email error
        XCTAssertEqual(signUpViewModel.emailError, .isEmpty)
        XCTAssertEqual(signUpViewModel.emailError?.message, "Please enter an email address")
    }
}
