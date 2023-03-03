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
                if let title = selectedMovie?.title {
                    DetailsView(selectedMovie: $selectedMovie)
                        .navigationTitle(title)
                } else if let name = selectedMovie?.name {
                    DetailsView(selectedMovie: $selectedMovie)
                        .navigationTitle(name)
                } else {
                    DetailsView(selectedMovie: $selectedMovie)
                }
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
                            MovieView(movieViewModel: movieViewModel, selectedMovie: $selectedMovie)
                                .navigationTitle("Popular")
                                .onAppear {
                                    movieViewModel.loadItemsPopular()
                                }
                        case "Top Rated":
                            MovieView(movieViewModel: movieViewModel, selectedMovie: $selectedMovie)
                                .navigationTitle("Top rated")
                                .onAppear {
                                    movieViewModel.loadItemsTopRated()
                                }
                        case "On Tv":
                            TvView(movieViewModel: movieViewModel, selectedMovie: $selectedMovie)
                                .navigationTitle("On Tv")
                                .onAppear {
                                    movieViewModel.loadItemsOnTv()
                                }
                        case "Airing Today":
                            TvView(movieViewModel: movieViewModel, selectedMovie: $selectedMovie)
                                .navigationTitle("Airing Today")
                                .onAppear {
                                    movieViewModel.loadItemsAiringToday()
                                }
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
