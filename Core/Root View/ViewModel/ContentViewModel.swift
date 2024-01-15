//
//  ContentViewModel.swift
//  Threads
//
//  Created by Melanie Andrade-Muñoz on 11/12/23.
//

import Foundation
import Combine
import Firebase

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self]  userSession in self?.userSession = userSession
        } .store(in: &cancellables)
    }
}
