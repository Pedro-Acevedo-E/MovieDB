//
//  TvListView.swift
//  MovieDB
//
//  Created by Pedro Acevedo on 02/03/23.
//

import SwiftUI

struct TvListView: View {
    let item: MovieResponse
    let adaptiveColumns = [
        GridItem(.adaptive(minimum: 180, maximum: 180))
    ]
    @Binding var selectedMovie: MovieResult?
    
    var body: some View {
        LazyVGrid(columns: adaptiveColumns, spacing: 10) {
            ForEach(item.results, id: \.id) { i in
                if let posterImage = i.poster_path {
                    ZStack {
                        Color(UIColor(named: "CardColor") ?? .gray)
                        VStack(alignment: .leading, spacing: 5) {
                            PosterImageView(posterImage: posterImage)
                            Text(i.name ?? "Title unavailable")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.green)
                            HStack {
                                Text(i.first_air_date ?? "")
                                    .bold()
                                    .foregroundColor(.green)
                                Spacer()
                                Image(systemName: "star.fill")
                                    .bold()
                                    .foregroundColor(.green)
                                Text(String(i.vote_average ?? 0.0))
                                    .bold()
                                    .foregroundColor(.green)
                            }
                            Text(i.overview ?? "")
                            Spacer()
                        }
                    }
                    .frame(height: 500)
                    .cornerRadius(15)
                    .onTapGesture {
                        selectedMovie = i
                    }
                }
            }
        }
        
    }
}
