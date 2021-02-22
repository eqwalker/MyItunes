//
//  MyiTunesTests.swift
//  MyiTunesTests
//
//  Created by Eric Walker on 2/21/21.
//

import Combine
import XCTest

@testable import MyiTunes

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
            .decode(type: Model.self, decoder: JSONDecoder())
            .subscribe(on: backgroundQueue)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}


class MyiTunesTests: XCTestCase {

    var cancellableSet: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "itunes.apple.com"
        components.path = "/search"
        let queryItem = URLQueryItem(name: "term", value: "Star Wars")
        components.queryItems = [queryItem]
        let request = URLRequest(url: components.url!)
        let network = Network<MyiTunesResponse>(session: URLSession.shared)
        
        let expects = expectation(description: "fetch")
        
        network.publisher(request: request)
            .sink { (completion) in
                print(completion)
            } receiveValue: { (response) in
                expects.fulfill()
                print(response)
            }
            .store(in: &cancellableSet)
        waitForExpectations(timeout: 2.0, handler: nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
