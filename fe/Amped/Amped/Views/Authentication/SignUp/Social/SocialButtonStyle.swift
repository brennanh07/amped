//
//  SocialButtonStyle.swift
//  Amped
//
//  Created by Brennan Humphrey on 1/14/25.
//

import Foundation
import SwiftUI

enum SocialButtonStyle {
    case google
    case apple
    
    var backgroundColor: Color {
        switch self {
        case .google:
            return .white
        case .apple:
            return .black
        }
    }
    
    var textColor: Color {
        switch self {
        case .google:
            return .black
        case .apple:
            return .white
        }
    }
    
    var outline: (color: Color, width: CGFloat) {
        switch self {
        case .google:
            return (color: .gray, width: 1)
        case .apple:
            return (color: .black, width: 1)
        }
    }
        
}
