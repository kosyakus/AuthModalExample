//
//  AuthView.swift
//  AuthModalExample
//
//  Created by Natalia Sinitsyna on 17.01.2025.
//

import SwiftUI

struct AuthView: View {
    
    @StateObject private var viewModel = AuthViewModel()
    @StateObject private var agreementViewModel = AuthAgreementModalViewModel()
        
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Image
                Image("authPicture")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    
                // Title
                Text("Quick login")
                    .font(.system(size: 32, weight: .medium))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 24)
                    .padding(.top, 56)
                
                // Кнопки мессенджеров
                VStack(spacing: 8) {
                    ForEach(LoginButtonId.allCases, id: \.self) { button in
                        MessengerButton(
                            icon: button.iconName,
                            title: button.displayName,
                            gradientColors: button.gradientColors,
                            foregroundColor: button.foregroundColor
                        ) {
                            viewModel.selectedButton = button
                            agreementViewModel.showModal = true
                        }
                    }
                }
                .padding(.top, 24)
                
                Spacer()
                
                // Дополнительные лейблы
                    Text("If you have any problems with authorization, please contact our support service support@domain.com")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(Color(UIColor.lightGray))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 50)
                        .textSelection(.disabled)
                
            }
            .padding(.top, 50)
            .padding(.horizontal, 24)
            .navigationBarHidden(true)
        }
        .overlay(
            Group {
                if agreementViewModel.showModal {
                    Color(white: 0, opacity: 0.5)
                        .edgesIgnoringSafeArea(.all)
                    AuthAgreementModalView(viewModel: agreementViewModel, onDismiss: {
                        // Обработчик закрытия модального окна
                        agreementViewModel.showModal = false
                        viewModel.handleLoginAfterAgreement()
                    })
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
                }
            }
        )
        .animation(.easeInOut, value: agreementViewModel.showModal)
    }
}
