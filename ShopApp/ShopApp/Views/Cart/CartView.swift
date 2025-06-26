//
//  CartView.swift
//  ShopApp
//
//  Created by Khaled on 24/06/2025.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        ScrollView {
                if cartManager.products.count > 0 {
                    ForEach(cartManager.products, id: \.id) { product in
                        ProductRow(product: product)
                    }
                    
                    HStack {
                        Text("Your cart total is")
                        Spacer()
                        Text("£\(cartManager.total, specifier: "%.2f")")
                            .bold()
                    }
                    .padding()
                } else {
                    Text("Your cart is empty.")
                }
            }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

#Preview {
    CartView()
}
