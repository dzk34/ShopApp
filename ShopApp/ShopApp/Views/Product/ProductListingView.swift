//
//  ProductListingView.swift
//  ShopApp
//
//  Created by Khaled on 22/06/2025.
//

import SwiftUI

struct ProductListingView: View {
    @Environment(AppRouter.self) private var router
    @EnvironmentObject var cartManager: CartManager
    @StateObject private var viewModel = ProductListingViewModel()
    @State var errorMessage: AppStateError? = nil
    @State var showAlert = false

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
                                    router.navigate(to: Destination.productDetails(product))
                                }
                                .environmentObject(cartManager)
                        }
                    }
                }
                .navigationTitle("Shop")
            }
        }
        .task {
            do {
                try await viewModel.fetchData()
            } catch {
                
            }
        }
        .alert(isPresented: $showAlert, error: errorMessage) { _ in
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
