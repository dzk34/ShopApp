//
//  AppTabView.swift
//  ShopApp
//
//  Created by Khaled on 24/06/2025.
//

import SwiftUI

struct AppTabView: View {
    @State private var selection = 0
    @StateObject var cartManager = CartManager()

    var body: some View {
        TabView(selection: $selection) {
            HomeTabCoordinator()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                        .tag(0)
                }
                .environmentObject(cartManager)
            
            ExploreTabCoordinator()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                        .tag(1)
                }

            CartTabCoordinator()
                .tabItem {
                    Image(systemName: "basket")
                    Text("Cart")
                        .tag(2)
                }
                .environmentObject(cartManager)

            ProfileTabCoordinator()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                        .tag(3)
                }
        }
    }
}

#Preview {
    AppTabView()
}
