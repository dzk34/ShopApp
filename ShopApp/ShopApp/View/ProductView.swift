//
//  ProductView.swift
//  ShopApp
//
//  Created by Khaled on 22/06/2025.
//

import SwiftUI

struct ProductView: View {
    let product: Product
    
    var body: some View {
        Text(product.name)
    }
}

#Preview {
    ProductView(product: Product(id: "1", name: "product 1", price: "1", image: ""))
}
