//
//  Product.swift
//  ShopApp
//
//  Created by Khaled on 22/06/2025.
//

import Foundation

struct ProductList: Codable {
    let products: [Product]
}

struct Product: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let price: String
    let image: String
}
