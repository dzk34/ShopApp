//
//  AppTabView.swift
//  ShopApp
//
//  Created by Khaled on 24/06/2025.
//

import SwiftUI

struct AppTabView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            AppTabCoordinator()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                        .tag(0)
                }
            
            ExploreTabCoordinator()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                        .tag(1)
                }
            BasketTabCoordinator()
                .tabItem {
                    Image(systemName: "basket")
                    Text("Basket")
                        .tag(2)
                }
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
