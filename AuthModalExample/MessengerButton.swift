//
//  MessengerButton.swift
//  AuthModalExample
//
//  Created by Natalia Sinitsyna on 17.01.2025.
//

import SwiftUI

struct MessengerButton: View {
    let icon: String?
    let title: String
    let gradientColors: [Color]
    let foregroundColor: Color
    let action: () -> Void
    
    init(
        icon: String? = nil,
        title: String,
        gradientColors: [Color],
        foregroundColor: Color = .white,
        action: @escaping () -> Void
    ) {
        self.icon = icon
        self.title = title
        self.gradientColors = gradientColors
        self.foregroundColor = foregroundColor
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            ZStack {
                // Градиентный фон
                LinearGradient(
                    gradient: Gradient(colors: gradientColors),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .cornerRadius(16)
                
                // Центрированный текст
                Text(title)
                    .fontWeight(.bold)
                    .foregroundColor(foregroundColor)
                    .multilineTextAlignment(.center)
                
                // Иконка слева
                HStack {
                    if let icon = icon {
                        Image(icon)
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(foregroundColor)
                            .padding(.leading, 24)
                    }
                    Spacer()
                }
            }
            .frame(height: 64)
            .frame(maxWidth: .infinity)
        }
    }
}
