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
                ForEach(movieResponse.results, id: \.self) { movie in
                    Text("Movie: " + (movie.title ?? "Title unavailable"))
                }
            case let .failed(error):
                Text(error.localizedDescription)
            }
        }
        .onAppear {
            movieViewModel.loadItemsTopRated()
        }
    }
}
