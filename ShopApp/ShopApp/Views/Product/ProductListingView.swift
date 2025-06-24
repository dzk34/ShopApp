//
//  ProductListingView.swift
//  ShopApp
//
//  Created by Khaled on 22/06/2025.
//

import SwiftUI

struct ProductListingView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var viewModel = ProductListingViewModel()
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.products) { product in
                            ProductView(product: product)
                                .onTapGesture {
                                    coordinator.push(page: .productDetails(product))
                                }
                        }
                    }
                }
                .navigationTitle("Shop")
            }
        }
        .task {
            await viewModel.fetchData()
        }
        .alert(isPresented: $viewModel.showAlert, error: viewModel.errorMessage) { _ in
          Button("OK") {
          }
        } message: { error in
          Text("Try again later.")
        }
    }
}

#Preview {
    ProductListingView()
}
