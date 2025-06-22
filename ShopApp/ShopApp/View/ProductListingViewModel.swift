//
//  ProductListingViewModel.swift
//  ShopApp
//
//  Created by Khaled on 22/06/2025.
//

import Foundation

protocol ProductListingViewModelProtocol {
    func fetchData()
}

final class ProductListingViewModel: ObservableObject, ProductListingViewModelProtocol {
    var products: [Product] = []

    func fetchData() {
        products = []
    }
}
