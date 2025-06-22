//
//  RequestManager.swift
//  ShopApp
//
//  Created by Khaled on 22/06/2025.
//

import Foundation

protocol RequestManagerProtocol {
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

class RequestManager: RequestManagerProtocol, ObservableObject {
    let apiManager: APIManagerProtocol
    let parser: DataParserProtocol

    init(apiManager: APIManagerProtocol = APIManager(), parser: DataParserProtocol = DataParser()) {
        self.apiManager = apiManager
        self.parser = parser
    }

    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
        let data = try await apiManager.perform(request)
        
        let decoded: T = try parser.parse(data: data)
        return decoded
    }
}
