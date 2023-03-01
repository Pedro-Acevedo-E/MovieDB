//
//  MovieResponse.swift
//  MovieDB
//
//  Created by Pedro Acevedo on 01/03/23.
//

import Foundation

public struct MovieResponse: Codable, Hashable {
    let page: Int
    let results: [MovieResult]
    let total_pages: Int
    let total_results: Int
}
