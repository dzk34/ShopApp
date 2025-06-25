//
//  AppRouter.swift
//  ShopApp
//
//  Created by Khaled on 25/06/2025.
//

import SwiftUI

@Observable
final class AppRouter {
    
    var navigationPath = NavigationPath()
        
    func navigate(to destination: any Hashable) {
        navigationPath.append(destination)
    }
    
    func navigateBack() {
        navigationPath.removeLast()
    }
    
    func navigateToRoot() {
        navigationPath.removeLast(navigationPath.count)
    }
}

