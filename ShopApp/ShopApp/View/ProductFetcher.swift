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
    func fetchProducts() async -> [Product] {
        []
    }
}
