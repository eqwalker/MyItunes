//
//  MyiTunesTests.swift
//  MyiTunesTests
//
//  Created by Eric Walker on 2/21/21.
//

import Combine
import XCTest

@testable import MyiTunes

class MyiTunesTests: XCTestCase {

    var cancellableSet: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDisplayPrice() {
        let price = 5.33
        let expected = "$5.33"
        let actual = displayPrice(price: price)
        XCTAssertEqual(expected, actual)
    }

    func testDisplayDate() {
        let date = Date.distantPast
        let expected = "Dec 31, 0001"
        let actual = displayDate(date: date)
        XCTAssertEqual(expected, actual)
    }

    func testNetworkCall() throws {
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
}
