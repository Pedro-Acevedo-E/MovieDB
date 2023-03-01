//
//  ContentView.swift
//  MovieDB
//
//  Created by Pedro Acevedo on 28/02/23.
//

import SwiftUI

struct ContentView: View {
        @StateObject var movieViewModel = MovieViewModel()
        
        var body: some View {
            VStack {
                switch movieViewModel.state {
                case .idle:
                    Text("Networking")
                case .loading:
                    ProgressView()
                case let .loaded(movieResponse):
                    Text("Loaded succesfully")
                    VStack {
                        ForEach(movieResponse.results, id: \.self) { movie in
                            Text("Movie: " + (movie.title ?? "Title unavailable"))
                        }
                    }
                case let .failed(error):
                    Text(error.localizedDescription)
                }
            }
            .onAppear {
                movieViewModel.loadItems()
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
