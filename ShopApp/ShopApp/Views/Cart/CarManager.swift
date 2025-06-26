//
//  CarManager.swift
//  ShopApp
//
//  Created by Khaled on 26/06/2025.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Float = 0.0
    @Published var paymentSuccess = false

    func addToCart(product: Product) {
        products.append(product)
        total += product.price
    }

    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
}

