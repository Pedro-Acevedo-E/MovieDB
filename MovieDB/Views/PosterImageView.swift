//
//  PosterImageView.swift
//  MovieDB
//
//  Created by Pedro Acevedo on 02/03/23.
//

import SwiftUI

struct PosterImageView: View {
    let posterImage: String
    
    var body: some View {
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
    }
}
