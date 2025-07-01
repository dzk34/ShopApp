//
//  ProductView.swift
//  ShopApp
//
//  Created by Khaled on 22/06/2025.
//

import SwiftUI

struct ProductView: View {
    @Inject(\.cartManager) var cartManager: CartManagerProtocol
    let product: Product
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .center) {
                AsyncImage(url: URL(string: product.image)) { result in
                    result.image?
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 180)
                        .clipped()
                }
                
                Text(product.title)
                    .font(.body)
                    .padding()
                
                Text(product.category)
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                Text("£\(product.price, specifier: "%.2f")")
            }
            Button {
                cartManager.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
            }
        }
        .padding()
    }
}

#Preview {
    ProductView(product: Product(id: 1, title: "Mens Casual Premium Slim Fit T-Shirts", price: 22.3, description: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.", category: "men's clothing", image: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg", rating: Rating(rate: 4.1, count: 259)))
}
