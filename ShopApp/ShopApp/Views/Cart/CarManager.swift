//
//  CarManager.swift
//  ShopApp
//
//  Created by Khaled on 26/06/2025.
//

import Foundation

protocol CartManagerProtocol {
    func addToCart(product: Product)
    func removeFromCart(product: Product)
    var products: [Product] { get set }
    var total: Float { get set }
}

class CartManager: ObservableObject, CartManagerProtocol {
    @Published var total: Float = 0.0
    
    @Published var products: [Product] = []
    
//    @Published private(set) var products: [Product] = []
//    @Published private(set) var total: Float = 0.0

    func addToCart(product: Product) {
        products.append(product)
        total += product.price
    }

    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
}
