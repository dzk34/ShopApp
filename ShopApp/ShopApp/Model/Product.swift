//
//  Product.swift
//  ShopApp
//
//  Created by Khaled on 22/06/2025.
//

import Foundation

struct ProductList {
    let products: [Product]
}

struct Product: Codable, Identifiable {
    let id: String
    let name: String
    let price: String
    let image: String
}
