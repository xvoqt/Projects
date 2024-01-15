//
//  CreateThreadViewModel.swift
//  Threads
//
//  Created by Mel Andrade-Muñoz on 11/26/23.
//

import Firebase

class CreateThreadViewModel: ObservableObject {    
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let thread = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.UploadThread(thread)
    }
}
