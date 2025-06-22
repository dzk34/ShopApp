//
//  ProductListingView.swift
//  ShopApp
//
//  Created by Khaled on 22/06/2025.
//

import SwiftUI

struct ProductListingView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject var viewModel: ProductListingViewModel

    var body: some View {
        List {
            ForEach(viewModel.products) { product in
                Text(product.name)
            }
        }
        .task {
            await viewModel.fetchData()
        }

        Text("ProductListingView")
        Button {
            coordinator.push(page: .basket)
        } label: {
            Text("View My Basket")
        }
    }
}

#Preview {
    ProductListingView(viewModel: ProductListingViewModel())
}
