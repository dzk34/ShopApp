//
//  ShopAppApp.swift
//  ShopApp
//
//  Created by Khaled on 22/06/2025.
//

import SwiftUI

@main
struct ShopAppApp: App {
//    let tabBarCoordinator = TabBarCoordinator()
    
    var body: some Scene {
        WindowGroup {
            AppTabView()
//            TabBarView(coordinator: tabBarCoordinator)
        }
    }
}
