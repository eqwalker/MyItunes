//
//  Network.swift
//  MyiTunes
//
//  Created by Eric Walker on 2/22/21.
//

import Combine
import Foundation

enum NetworkError: Error {
    case failed
    case decode(Error)
    case noAccess
}

struct Network<Model: Decodable> {
    let backgroundQueue = DispatchQueue(label: "MyItunes")

    let session: URLSession
    public init(session: URLSession) {
        self.session = session
    }
    public func publisher(request: URLRequest) -> AnyPublisher<Model, Error> {

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        return session.dataTaskPublisher(for: request)
            .mapError { urlError in
                NetworkError.decode(urlError)
            }
            .tryMap { output -> Data in
                guard let response = output.response as? HTTPURLResponse else {
                    throw URLError(.badServerResponse)
                }
                if (400...499) ~= response.statusCode {
                    throw NetworkError.noAccess
                }

                if response.statusCode >= 500 {
                    throw NetworkError.failed
                }

                return output.data
            }
            .map {
                return $0
            }
            .decode(type: Model.self, decoder: decoder)
            .subscribe(on: backgroundQueue)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

