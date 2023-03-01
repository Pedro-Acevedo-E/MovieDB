//
//  Movie.swift
//  MovieDB
//
//  Created by Pedro Acevedo on 01/03/23.
//

import Foundation

public struct MovieResult: Codable, Hashable {
    let adult: Bool?
    let backdrop_path: String?
    let genre_ids: [Int]
    let id: Int?
    let original_language: String?
    let original_title: String?
    let overview: String?
    let popularity: Double?
    let poster_path: String?
    let release_date: String?
    let title: String?
    let video: Bool?
    let vote_average: Double?
    let vote_count: Int?
}
