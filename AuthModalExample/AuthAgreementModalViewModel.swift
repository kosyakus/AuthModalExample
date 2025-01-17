//
//  AuthAgreementModalViewModel.swift
//  AuthModalExample
//
//  Created by Natalia Sinitsyna on 17.01.2025.
//

import SwiftUI

class AuthAgreementModalViewModel: ObservableObject {
    
    @Published var showModal: Bool = false
    
    func agreeAction() {
        print("Agree and continue pressed")
        showModal = false
    }
    
    func declineAction() {
        print("Decline pressed")
        showModal = false
    }
}
