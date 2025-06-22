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
    let productFetcher: ProductFetcherProtocol
    
    @Published var isLoading: Bool = false
    @Published var products: [Product] = []

    init(productFetcher: ProductFetcherProtocol) {
        self.productFetcher = productFetcher
    }

    func fetchData() async  {
        print("fetchData")
        isLoading = true
        
        products = [Product(id: "1", name: "product 1", price: "10", image: ""),
                    Product(id: "2", name: "product 2", price: "20", image: ""),
                    Product(id: "3", name: "product 3", price: "30", image: "")]
        isLoading = false
    }
}
