//
//  PopularView.swift
//  MovieDB
//
//  Created by Pedro Acevedo on 02/03/23.
//

import SwiftUI

struct MovieView: View {
    @ObservedObject var movieViewModel: MovieViewModel
    @Binding var selectedMovie: MovieResult?
    
    var body: some View {
        VStack {
            switch movieViewModel.state {
            case .idle:
                ProgressView()
            case .loading:
                ProgressView()
            case let .loaded(movieResponse):
                MovieListView(item: movieResponse, selectedMovie: $selectedMovie)
            case let .failed(error):
                Text(error.localizedDescription)
            }
        }
        .onAppear {
            movieViewModel.loadItemsPopular()
        }
    }
}


