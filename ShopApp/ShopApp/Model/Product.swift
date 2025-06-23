//
//  Product.swift
//  ShopApp
//
//  Created by Khaled on 22/06/2025.
//

import Foundation

struct Product: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let price: Float
    let description: String
    let category: String
    let image: String
    let rating: Rating
}

struct Rating: Codable, Hashable {
    let rate: Float
    let count: Int
}
