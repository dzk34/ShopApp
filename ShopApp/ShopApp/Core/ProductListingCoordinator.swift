//
//  ProductListingCoordinator.swift
//  ShopApp
//
//  Created by Khaled on 24/06/2025.
//

import SwiftUI

struct ProductListingCoordinator: View {
    @Environment(AppRouter.self) private var router
    
    var body: some View {
        ProductListingView()
            .navigationDestination(for: Destination.self) { destination in
                            switch destination {
                            case .productDetails(let product):
                                ProductDetailsView(product: product)
                            }
                        }
    }
}

#Preview {
    ProductListingCoordinator()
}
