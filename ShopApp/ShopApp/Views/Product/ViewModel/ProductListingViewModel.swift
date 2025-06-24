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
    @Published var errorMessage: AppStateError? = nil
    @Published var showAlert = false

    @MainActor
    func fetchData() async  {
        isLoading = true
        
        do {
            self.products = try await productFetcher.fetchProducts()
        } catch {
            errorMessage = AppStateError.someError
            showAlert = true
        }
        isLoading = false
    }
}
