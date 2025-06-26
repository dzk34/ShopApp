//
//  AppTabCoordinator.swift
//  ShopApp
//
//  Created by Khaled on 24/06/2025.
//

import SwiftUI

struct HomeTabCoordinator: View {
    @State var router: AppRouter = .init()
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            ProductListingCoordinator()
        }
        .environment(router)
    }
}

#Preview {
    HomeTabCoordinator()
}
