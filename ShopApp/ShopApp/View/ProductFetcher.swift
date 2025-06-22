//
//  ProductFetcher.swift
//  ShopApp
//
//  Created by Khaled on 22/06/2025.
//

import Foundation

protocol ProductFetcherProtocol {
    func fetchProducts() async -> [Product]
}

struct ProductFetcher: ProductFetcherProtocol {
    var requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
    
    func fetchProducts() async -> [Product] {
        let requestData = ProductRequest.products

        do {
            let productList: ProductList = try await requestManager.perform(requestData)
            return productList.products
        } catch {
            print(error)
            return []
        }
    }
}
