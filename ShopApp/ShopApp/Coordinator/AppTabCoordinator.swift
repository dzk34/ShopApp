//
//  AppTabCoordinator.swift
//  ShopApp
//
//  Created by Khaled on 24/06/2025.
//

import SwiftUI

struct AppTabCoordinator: View {
    @State private var path = [Int]()
    var body: some View {
        NavigationStack(path: $path) {
            
        }
    }
}

#Preview {
    AppTabCoordinator()
}
