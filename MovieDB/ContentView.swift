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
    
    var body: some View {
        NavigationView {
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
                        PopularView(movieViewModel: movieViewModel)
                    case "Top Rated":
                        TopRatedView(movieViewModel: movieViewModel)
                    case "On Tv":
                        Text("On Tv selected")
                    case "Airing Today":
                        Text("Airing today selected")
                    default:
                        Text("Invalid selection")
                    }
                }
            }.navigationTitle("Popular")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
