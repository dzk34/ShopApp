//
//  URLSessionProtocolMock.swift
//  ShopAppTests
//
//  Created by Khaled on 24/06/2025.
//

import Foundation

@testable import ShopApp

class URLSessionProtocolMock: URLSessionProtocol {
    let data: Data
    var dataURL: URL?
    
    init(data: Data) {
        self.data = data
    }
    
    func data(from url: URL, delegate: (URLSessionTaskDelegate)?) async throws -> (Data, URLResponse) {
        dataURL = url
        
        guard let response = HTTPURLResponse(url: url,
                                       statusCode: 200,
                                       httpVersion: nil,
                                       headerFields: nil)
        else {
            fatalError() // it's ok to crash for now because it's a test, but in the real world we will do it properly later
        }
        
        return (data, response)
    }
    
    
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        guard let url = request.url, let response = HTTPURLResponse(url: url,
                                       statusCode: 200,
                                       httpVersion: nil,
                                       headerFields: nil)
        else {
            fatalError()
        }

        dataURL = url

        return (data, response)
    }
}

extension URLSessionProtocolMock {
    convenience init?(products: [Product]) {
        do {
            let data = try JSONEncoder().encode(products)
            self.init(data: data)
        } catch {
            fatalError()
        }
    }
}
