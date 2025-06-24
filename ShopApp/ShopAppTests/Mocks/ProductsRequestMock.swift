//
//  ProductsRequestMock.swift
//  ShopAppTests
//
//  Created by Khaled on 24/06/2025.
//

import Foundation

@testable import ShopApp

enum ProductsRequestMock: RequestProtocol {
    case fetchProducts

    var requestType: RequestType {
        return .get
    }

    var path: String {
        guard let path = Bundle.main.path(forResource: "Product", ofType: "json") else { return "" }
        return path
    }
}
