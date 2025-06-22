//
//  ProductListingViewModel.swift
//  ShopApp
//
//  Created by Khaled on 22/06/2025.
//

import Foundation

protocol ProductListingViewModelProtocol {
    func fetchData() async
}

final class ProductListingViewModel: ObservableObject, ProductListingViewModelProtocol {
    var products: [Product] = []

    func fetchData() async  {
        print("fetchData")
        products = [Product(id: "1", name: "product 1", price: "10", image: ""),
                    Product(id: "2", name: "product 2", price: "20", image: ""),
                    Product(id: "3", name: "product 3", price: "30", image: "")]
    }
}
