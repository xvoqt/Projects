//
//  Explore_View.swift
//  Threads
//
//  Created by Mel Andrade-Muñoz on 11/8/23.
//

import SwiftUI

struct Explore_View: View {
    @State private var searchText = ""
    @StateObject var viewModel = ExploreViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            // anything a navigation link w/ value based nagivation, object must be hashable
                            NavigationLink(value: user) {
                                VStack {
                                    UserCell(user: user)
                                }
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in ProfileView(user: user)
            })
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        Explore_View()
    }
}
