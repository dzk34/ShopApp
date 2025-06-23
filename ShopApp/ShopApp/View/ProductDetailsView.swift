//
//  ProductDetailsView.swift
//  ShopApp
//
//  Created by Khaled on 22/06/2025.
//

import SwiftUI

struct ProductDetailsView: View {
    var product: Product
    var body: some View {
        Text("ProductDetailsView : \(product.name)")
    }
}

#Preview {
    ProductDetailsView(product: Product(id: "1", name: "1", price: "1", image: "1"))
}
