//
//  MovieGenreView.swift
//  MovieDB
//
//  Created by Pedro Acevedo on 02/03/23.
//

import SwiftUI

struct MovieGenreView: View {
    let item: Int
    var body: some View {
        switch item {
        case 10759:
            Text("Action & Adventure")
        case 28:
            Text("Action")
        case 12:
            Text("Adventure")
        case 16:
            Text("Animation")
        case 35:
            Text("Comedy")
        case 80:
            Text("Crime")
        case 99:
            Text("Documentary")
        case 18:
            Text("Drama")
        case 10751:
            Text("Family")
        case 10762:
            Text("Kids")
        case 9648:
            Text("Mystery")
        case 10763:
            Text("News")
        case 10764:
            Text("Reality")
        case 10765:
            Text("Scy-Fi & Fantasy")
        case 10766:
            Text("Soap")
        case 10767:
            Text("Talk")
        case 10768:
            Text("War & Politics")
        case 14:
            Text("Fantasy")
        case 36:
            Text("History")
        case 27:
            Text("Horror")
        case 10402:
            Text("Music")
        case 10749:
            Text("Romance")
        case 878:
            Text("Science Fiction")
        case 10770:
            Text("Tv Movie")
        case 53:
            Text("Thriller")
        case 10752:
            Text("War")
        case 37:
            Text("Western")
        default:
            Text("")
        }
    }
}
