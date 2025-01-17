//
//  SignInWithAppleDelegate.swift
//  AuthModalExample
//
//  Created by Natalia Sinitsyna on 17.01.2025.
//

import AuthenticationServices

class SignInWithAppleDelegate: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    static let shared = SignInWithAppleDelegate()
    var onAuthorizationSuccess: (() -> Void)?
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let userID = credential.user
            let email = credential.email
            let fullName = credential.fullName
            
            print("Apple ID Authorization Successful")
            print("User ID: \(userID)")
            print("Email: \(email ?? "No email provided")")
            print("Full Name: \(fullName ?? PersonNameComponents())")
            
            DispatchQueue.main.async {
                self.onAuthorizationSuccess?()
            }
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Apple ID Authorization Failed: \(error.localizedDescription)")
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first(where: { $0.isKeyWindow }) else {
            fatalError("Unable to find the key window for presentation")
        }
        return window
    }
}
