//
//  ProductFetcher.swift
//  ShopApp
//
//  Created by Khaled on 22/06/2025.
//

import Foundation

protocol ProductFetcherProtocol {
    func fetchProducts() async throws -> [Product]
}

struct ProductFetcher: ProductFetcherProtocol {
    @Inject(\.requestManager) var requestManager: RequestManagerProtocol

    func fetchProducts() async throws -> [Product] {
        let requestData = ProductRequest.products

        do {
            let productList: [Product] = try await requestManager.perform(requestData)
            return productList
        } catch {
            throw NetworkError.noData
        }
    }
}
