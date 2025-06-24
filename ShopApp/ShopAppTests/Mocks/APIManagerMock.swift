//
//  APIManagerMock.swift
//  ShopAppTests
//
//  Created by Khaled on 24/06/2025.
//

import Foundation

@testable import ShopApp

struct APIManagerMock: APIManagerProtocol {
    let urlSession: URLSessionProtocol

    init(urlSession: URLSessionProtocol) {
        self.urlSession = urlSession
    }

    func perform(_ request: RequestProtocol) async throws -> Data {
        return try Data(contentsOf: URL(fileURLWithPath: request.path), options: .mappedIfSafe)
    }
}
