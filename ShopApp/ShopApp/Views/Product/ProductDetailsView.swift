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
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: product.image)) { result in
                    result.image?
                        .resizable()
                        .scaledToFit()
                }
                
                Text(product.title)
                    .font(.title)
                    .padding()
                
                Text("£\(product.price, specifier: "%.2f")")
                    .font(.title2)
                
                Text(product.description)
                    .font(.title2)
                    .padding()
                
                Text(product.category)
                    .font(.title3)
                    .foregroundStyle(.gray)
                    .padding()
                
                Text("Rating: \(product.rating.rate, specifier: "%.2f") (\(product.rating.count))")
            }
            .padding()
        }
    }
}

#Preview {
    ProductDetailsView(product: Product(id: 1, title: "Mens Casual Premium Slim Fit T-Shirts", price: 22.3, description: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.", category: "men's clothing", image: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg", rating: Rating(rate: 4.1, count: 259)))
}
