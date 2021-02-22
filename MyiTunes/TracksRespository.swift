//
//  TracksRespository.swift
//  MyiTunes
//
//  Created by Eric Walker on 2/22/21.
//

import Combine
import Foundation

typealias TracksPublisher = AnyPublisher<[Track], Error>

protocol TracksRepository {
    func tracks(searchTerm: String) -> TracksPublisher
}

class MockTracksRepository: TracksRepository {
    func tracks(searchTerm: String) -> TracksPublisher {
        let publisher = CurrentValueSubject<[Track], Error>([Track.mock, Track.mock])
        return publisher.eraseToAnyPublisher()
    }
}

class RestfulTracksRepository: TracksRepository {
    func tracks(searchTerm: String) -> TracksPublisher {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "itunes.apple.com"
        components.path = "/search"
        let queryItem = URLQueryItem(name: "term", value: searchTerm)
        components.queryItems = [queryItem]
        let request = URLRequest(url: components.url!)
        let network = Network<MyiTunesResponse>(session: URLSession.shared)
        return network.publisher(request: request)
            .flatMap { (response) in
                return CurrentValueSubject<[Result],Error>(response.results ?? [])
            }
            .map({ (results) -> [Track] in
                return results.map(Track.toTrack)
            })
            .eraseToAnyPublisher()
    }
}

