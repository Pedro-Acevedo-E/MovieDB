//
//  TopRatedView.swift
//  MovieDB
//
//  Created by Pedro Acevedo on 02/03/23.
//

import SwiftUI

struct TopRatedView: View {
    @ObservedObject var movieViewModel: MovieViewModel
    
    var body: some View {
        VStack {
            switch movieViewModel.state {
            case .idle:
                ProgressView()
            case .loading:
                ProgressView()
            case let .loaded(movieResponse):
                MovieListView(item: movieResponse)
            case let .failed(error):
                Text(error.localizedDescription)
            }
        }
        .onAppear {
            movieViewModel.loadItemsTopRated()
        }
    }
}
