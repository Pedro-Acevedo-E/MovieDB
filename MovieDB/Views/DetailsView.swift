//
//  MovieDetailsView.swift
//  MovieDB
//
//  Created by Pedro Acevedo on 02/03/23.
//

import SwiftUI

struct DetailsView: View {
    @Binding var selectedMovie: MovieResult?
    
    var body: some View {
        ScrollView {
            if let posterImage = selectedMovie?.poster_path {
                PosterImageView(posterImage: posterImage)
                    .frame(width: 188)
            }
            VStack {
                Text("Title")
                    .font(.title2)
                    .bold()
                    .padding()
                if let title = selectedMovie?.title {
                    Text(title)
                } else if let title = selectedMovie?.name {
                    Text(title)
                } else {
                    Text("Unavailable")
                }
                
                Text("Synopsis")
                    .font(.title2)
                    .bold()
                    .padding()
                if let synopsis = selectedMovie?.overview {
                    Text(synopsis)
                } else {
                    Text("Synopsis unavailable")
                }
            }.padding()
            VStack (spacing: 10) {
                Text("Details")
                    .font(.title2)
                    .bold()
                    .padding(.bottom)
                
                HStack {
                    if let release = selectedMovie?.release_date {
                        Text("Release Date: " + release)
                    } else if let airDate = selectedMovie?.first_air_date {
                        Text("Air Date: " + airDate)
                    } else {
                        Text("Unavailable")
                    }
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundColor(.green)
                    Text(String(selectedMovie?.vote_average ?? 0.0))
                }
                
                HStack {
                    Text("Vote Count: " + String(selectedMovie?.vote_count ?? 0))
                    Spacer()
                    Text("Original language: " + (selectedMovie?.original_language ?? "Unavailable"))
                }
                
                Text("Genres")
                    .font(.title2)
                    .bold()
                    .padding(.bottom)
                if let genreIDs = selectedMovie?.genre_ids {
                    ForEach(genreIDs, id: \.self) { genre in
                        MovieGenreView(item: genre)
                    }
                }
            }
            Spacer()
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button {
                    selectedMovie = nil
                } label: {
                    Image(systemName: "arrowshape.turn.up.left")
                        .foregroundColor(.green)
                }
            }
        }
    }
}
