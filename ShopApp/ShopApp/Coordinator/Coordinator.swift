//
//  Coordinator.swift
//  ShopApp
//
//  Created by Khaled on 22/06/2025.
//

import Foundation
import SwiftUI

protocol CoordinatorProtocol {
    func push(page: AppPages)
    func pop()
    func popToRoot()
}


class Coordinator: CoordinatorProtocol, ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    
    func push(page: AppPages) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page: AppPages) -> some View {
        switch page {
        case .main:
            ProductListingView(viewModel: ProductListingViewModel())
        case .basket:
            BasketView()
        }
    }
}
