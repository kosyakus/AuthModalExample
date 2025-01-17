//
//  AuthViewModel.swift
//  AuthModalExample
//
//  Created by Natalia Sinitsyna on 17.01.2025.
//

import AuthenticationServices
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var phoneNumber: String = ""
    @Published var navigateToMessengerSelection: Bool = false
    @Published var selectedButton: LoginButtonId? = nil
    @Published var showMailErrorAlert: Bool = false
    
    var completionHandler: (() -> Void)?
    
    init() {
       
    }
    
    
    func handleLoginAfterAgreement() {
        guard let button = selectedButton else { return }
        handleLogin(for: button)
        selectedButton = nil
    }
    
    func handleLogin(for button: LoginButtonId) {
        switch button {
        case .apple:
            print("Apple ID login tapped")
            startSignInWithAppleFlow()
        case .gmail:
            print("gmail login tapped")
            // логику для gmail
        case .email:
            print("email login tapped")
            // логику для email
        }
    }
    
    func startSignInWithAppleFlow() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = SignInWithAppleDelegate.shared
        controller.presentationContextProvider = SignInWithAppleDelegate.shared
        
        SignInWithAppleDelegate.shared.onAuthorizationSuccess = {
            DispatchQueue.main.async {
                self.navigateToMessengerSelection = true
            }
        }
        
        controller.performRequests()
    }
    
    func onFinish() {
        completionHandler?()
    }
}
