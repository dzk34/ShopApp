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
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: product.image)) { result in
                result.image?
                    .resizable()
                    .scaledToFill()
                    
            }
            .frame(width: 240, height: 240)

            Text(product.name)
                .font(.title)
            
            Text(product.price)
        }
        .padding()
    }
}

#Preview {
    ProductView(product: Product(id: "1", name: "Test Shirt", price: "£199", image: "https://media.endclothing.com/media/f_auto,q_auto,w_760,h_760/prodmedia/media/catalog/product/2/6/26-03-2018_gosha_rubchinskiyxadidas_copaprimeknitboostmidsneaker_yellow_g012sh12-220_ka_1.jpg"))
}
