//
//  ContentView.swift
//  MovieDB
//
//  Created by Pedro Acevedo on 28/02/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var movieViewModel = MovieViewModel()
    let pickerSelections = ["Popular", "Top Rated", "On Tv", "Airing Today"]
    @State private var pickerSelection = "Popular"
    @State var selectedMovie: MovieResult? = nil
    
    var body: some View {
        NavigationView {
            if selectedMovie != nil {
                MovieDetailsView(selectedMovie: $selectedMovie)
                    .navigationTitle(selectedMovie?.title ?? "")
            } else {
                VStack {
                    Picker("Category", selection: $pickerSelection){
                        ForEach(pickerSelections, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    ScrollView {
                        switch pickerSelection {
                        case "Popular":
                            PopularView(movieViewModel: movieViewModel, selectedMovie: $selectedMovie)
                                .navigationTitle("Popular")
                        case "Top Rated":
                            TopRatedView(movieViewModel: movieViewModel, selectedMovie: $selectedMovie)
                                .navigationTitle("Top Rated")
                        case "On Tv":
                            Text("On Tv selected")
                                .navigationTitle("On tv")
                        case "Airing Today":
                            Text("Airing today selected")
                                .navigationTitle("Airing Today")
                        default:
                            Text("Invalid selection")
                                .navigationTitle("Error")
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
