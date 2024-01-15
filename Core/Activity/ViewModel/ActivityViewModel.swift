//
//  ActivityViewModel.swift
//  Threads
//
//  Created by Mel Andrade-Muñoz on 11/27/23.
//

import Foundation
import Combine

class ActivityViewModel: ObservableObject {
    @Published var userContentListViewModel: UserContentListViewModel
    
    private var cancellables = Set<AnyCancellable>()

    init(user: User) {
        self.userContentListViewModel = UserContentListViewModel(user: user)
        
        // Add any other configurations or subscribers needed for the activity view
    }
    
    // Add any additional functions or methods as needed
}
