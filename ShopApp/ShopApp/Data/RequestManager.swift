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
    @Inject(\.apiManager) var apiManager: APIManagerProtocol
    @Inject(\.dataParser) var dataParser: DataParserProtocol

    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
        let data = try await apiManager.perform(request)
        
        let decoded: T = try dataParser.parse(data: data)
        return decoded
    }
}
