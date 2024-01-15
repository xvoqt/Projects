//
//  Feed_View.swift
//  Threads
//
//  Created by Mel Andrade-Muñoz on 11/8/23.
//

import SwiftUI

struct Feed_View: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.threads) { thread in
                        ThreadCell(thread: thread)
                    }
                }
            }
                .refreshable {
                    Task { try await viewModel.fetchThreads() }
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundColor(.black)
                }
            }
        }
    }
    
    struct FeedView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationStack {
                Feed_View()
            }
        }
    }
}
