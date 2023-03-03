//
//  MovieViewModel.swift
//  MovieDB
//
//  Created by Pedro Acevedo on 01/03/23.
//

import Foundation
import Combine

public final class MovieViewModel: ObservableObject {
    @Published private(set) var state: State = .idle
    private let decoder: JSONDecoder = .init()
    private var cancellable: AnyCancellable?
    private let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    func loadItemsTopRated() {
        state = .loading
        if let url = API.createURLRequest(type: "movie/top_rated") {
        cancellable = session
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MovieResponse.self, decoder: decoder)
            .map(State.loaded)
            .catch { Just(.failed($0)) }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] movieResponse in
                self?.state = movieResponse
            }
        }
    }
    
    func loadItemsPopular() {
        state = .loading
        if let url = API.createURLRequest(type: "movie/popular") {
        cancellable = session
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MovieResponse.self, decoder: decoder)
            .map(State.loaded)
            .catch { Just(.failed($0)) }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] movieResponse in
                self?.state = movieResponse
            }
        }
    }
    
    func loadItemsOnTv() {
        state = .loading
        if let url = API.createURLRequest(type: "tv/on_the_air") {
        cancellable = session
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MovieResponse.self, decoder: decoder)
            .map(State.loaded)
            .catch { Just(.failed($0)) }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] movieResponse in
                self?.state = movieResponse
            }
        }
    }
    
    func loadItemsAiringToday() {
        state = .loading
        if let url = API.createURLRequest(type: "tv/airing_today") {
        cancellable = session
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MovieResponse.self, decoder: decoder)
            .map(State.loaded)
            .catch { Just(.failed($0)) }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] movieResponse in
                self?.state = movieResponse
            }
        }
    }
}

extension MovieViewModel {
    public enum State {
        case idle
        case loading
        case loaded(MovieResponse)
        case failed(Error)
    }
}

