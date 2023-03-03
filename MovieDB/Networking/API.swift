//
//  API.swift
//  MovieDB
//
//  Created by Pedro Acevedo on 01/03/23.
//

import Foundation

struct API {
    static func createURLRequest(type: String) -> URLRequest? {
        let api_key = "a94ccb3836ae282e40420c45844214a8"
        var parameters: [String : String]
        parameters = ["api_key" : api_key, "language" : "en-US", "page" : "1"]
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.themoviedb.org"
        urlComponents.path = "/3/" + type
        urlComponents.queryItems = parameters.map({ key, value in
            URLQueryItem(name: key, value: value)
        })
        
        guard let url = urlComponents.url else { return nil }
        
        return URLRequest(url: url)
    }
}
//https://api.themoviedb.org/3/movie/top_rated?api_key=a94ccb3836ae282e40420c45844214a8&language=en-US&page=1
//https://api.themoviedb.org/3/movie/popular?api_key=a94ccb3836ae282e40420c45844214a8&language=en-US&page=1
//https://api.themoviedb.org/3/tv/on_the_air?api_key=a94ccb3836ae282e40420c45844214a8&language=en-US&page=1

