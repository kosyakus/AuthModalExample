//
//  LoginButtonId.swift
//  AuthModalExample
//
//  Created by Natalia Sinitsyna on 17.01.2025.
//

import SwiftUI

enum LoginButtonId: CaseIterable {
    case apple
    case gmail
    case email
    
    var displayName: String {
        switch self {
        case .apple: return "Sign in with Apple"
        case .gmail: return "Sign in with Google"
        case .email: return "Sign in with Email"
        }
    }
    
    var iconName: String {
        switch self {
        case .apple: return "SocApple"
        case .gmail: return "SocGmail"
        case .email: return "SocEmail"
        }
    }
    
    var gradientColors: [Color] {
        switch self {
        case .apple: return [Color.black]
        case .gmail: return [Color(UIColor.systemGray6)]
        case .email: return [Color(UIColor.systemGray6)]
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .apple: return Color.white
        case .gmail: return Color.black
        case .email: return Color.black
        }
    }
}
