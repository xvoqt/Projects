//
//  ContentView.swift
//  Threads
//
//  Created by Mel Andrade-Muñoz on 11/6/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ThreadsTabView()
            } else {
                Login_View()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
