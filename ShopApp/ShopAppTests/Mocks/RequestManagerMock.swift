//
//  RequestManagerMock.swift
//  ShopAppTests
//
//  Created by Khaled on 24/06/2025.
//

import Foundation

@testable import ShopApp

class RequestManagerMock: RequestManagerProtocol {
    var dataParser: DataParserProtocol
    let apiManager: APIManagerProtocol

    init(apiManager: APIManagerProtocol, dataParser: DataParserProtocol) {
        self.apiManager = apiManager
        self.dataParser = dataParser
    }

    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
        let data = try await apiManager.perform(request)
        let decoded: T = try dataParser.parse(data: data)
        return decoded
    }
}
