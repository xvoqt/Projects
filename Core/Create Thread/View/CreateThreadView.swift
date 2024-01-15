//
//  UploadThread_View.swift
//  Threads
//
//  Created by Mel Andrade-Muñoz on 11/8/23.
//

import SwiftUI

struct CreateThreadView: View {
    @ObservedObject var viewModel = CreateThreadViewModel()
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    CircularProfileImageView(user: user, size: .small)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user?.username ?? "")
                            .fontWeight(.semibold)
                        
                        TextField("Start a thread...", text: $caption, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !caption.isEmpty {
                        Button {
                            caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                Spacer()
                
                // Your content here
                
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    dismiss()
                },
                trailing: Button("Post") {
                    Task {
                        try await viewModel.uploadThread(caption: caption)
                        dismiss()
                    }
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .opacity(caption.isEmpty ? 0.5 : 1.0)
                .disabled(caption.isEmpty)
            )
        }
    }
}

struct CreateThreadView_Previews: PreviewProvider {
    static var previews: some View {
        CreateThreadView()
    }
}
