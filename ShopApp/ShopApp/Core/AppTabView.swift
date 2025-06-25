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
            HomeTabCoordinator()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                        .tag(0)
                }
        }
    }
}

#Preview {
    AppTabView()
}
