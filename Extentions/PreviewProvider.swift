//
//  PreviewProvider.swift
//  Threads
//
//  Created by Melanie Andrade-Muñoz on 11/16/23.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Jesse Pinkman", email: "pinkman@gmail.com", username: "capncook")
    
    let thread = Thread(ownerUid: "123", caption: "Test thread", timestamp: Timestamp(), likes: 0)
}
