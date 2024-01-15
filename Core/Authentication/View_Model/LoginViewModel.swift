//
//  LoginViewModel.swift
//  Threads
//
//  Created by Melanie Andrade-Muñoz on 11/12/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

   
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}

