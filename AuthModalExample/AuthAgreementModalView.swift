//
//  AuthAgreementModalView.swift
//  AuthModalExample
//
//  Created by Natalia Sinitsyna on 17.01.2025.
//

import SwiftUI

struct AuthAgreementModalView: View {
    @ObservedObject var viewModel: AuthAgreementModalViewModel
    
    var onDismiss: () -> Void

    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 24) {
                // Заголовок
                Text("User Agreement")
                    .font(.system(size: 24, weight: .regular))
                    .multilineTextAlignment(.leading)
                    .padding(.top, 24)
                
                // Условия использования
                // Текст с атрибутированными ссылками
                Text(agreementAttributedString())
                    .font(.system(size: 16, weight: .regular))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .tint(.blue) // Цвет ссылок
                                
                // Кнопки
                VStack(spacing: 12) {
                    Button(action: {
                        viewModel.agreeAction()
                        viewModel.showModal = false
                        onDismiss()
                    }) {
                        Text("Agree and continue")
                            .frame(height: 56)
                            .font(.system(size: 16, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .background(Color(UIColor.systemBlue))
                            .foregroundColor(Color.white)
                            .cornerRadius(16)
                    }
                    
                    Button(action: {
                        viewModel.declineAction()
                        
                    }) {
                        Text("Back")
                            .frame(height: 56)
                            .font(.system(size: 16, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .background(Color(UIColor.systemGray6))
                            .foregroundColor(Color.black)
                            .cornerRadius(16)
                    }
                }
                .padding(.bottom, 40)
            }
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(24, corners: [.topLeft, .topRight])
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    // Создание атрибутированного текста с выделением ссылки
    private func agreementAttributedString() -> AttributedString {
        let title = "By continuing to use the application you agree to the terms and conditions of the user agreement" // Полный текст
        let linkText = "the terms and conditions of the user agreement" // Текст ссылки
        
        var attributedString = AttributedString(title)
        
        if let range = attributedString.range(of: linkText), let link = URL(string: "https://example.com") {
            attributedString[range].link = link
            attributedString[range].foregroundColor = .blue
            attributedString[range].underlineStyle = .single
        }
        
        return attributedString
    }
}
