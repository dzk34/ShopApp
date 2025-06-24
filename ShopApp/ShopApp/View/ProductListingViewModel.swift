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
    @Inject(\.productFetcher) var productFetcher: ProductFetcherProtocol
    
    @Published var isLoading: Bool = false
    @Published var products: [Product] = []

    @MainActor
    func fetchData() async  {
        isLoading = true
        
        self.products = await productFetcher.fetchProducts()
        isLoading = false
    }
}
