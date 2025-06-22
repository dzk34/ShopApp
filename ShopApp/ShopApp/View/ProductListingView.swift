//
//  ProductListingView.swift
//  ShopApp
//
//  Created by Khaled on 22/06/2025.
//

import SwiftUI

struct ProductListingView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        Text("ProductListingView")
        Button {
            coordinator.push(page: .basket)
        } label: {
            Text("View My Basket")
        }
    }
}

#Preview {
    ProductListingView()
}
