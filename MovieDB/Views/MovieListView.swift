//
//  MovieListView.swift
//  MovieDB
//
//  Created by Pedro Acevedo on 02/03/23.
//

import SwiftUI

struct MovieListView: View {
    let item: MovieResponse
    let adaptiveColumns = [
        GridItem(.adaptive(minimum: 180, maximum: 180))
    ]
    
    var body: some View {
        LazyVGrid(columns: adaptiveColumns, spacing: 10) {
            ForEach(item.results, id: \.id) { i in
                if let posterImage = i.poster_path {
                    ZStack {
                        Color(UIColor(named: "CardColor") ?? .gray)
                        VStack(alignment: .leading, spacing: 5) {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500" + posterImage)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(height: 277)
                                case .success(let image):
                                    image.resizable()
                                        .frame(height: 277)
                                case .failure:
                                    ProgressView()
                                        .frame(height: 277)
                                @unknown default:
                                    Image(systemName: "questionmark")
                                }
                            }
                            Text(i.title ?? "Title unavailable")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.green)
                            HStack {
                                Text(i.release_date ?? "")
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
                }
            }
        }
    }
}
