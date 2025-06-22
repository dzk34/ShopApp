//
//  ProductRequest.swift
//  ShopApp
//
//  Created by Khaled on 22/06/2025.
//

import Foundation

enum ProductRequest: RequestProtocol {
    case products

    var requestType: RequestType {
        .get
    }
    
    var path: String {
        switch self {
        case .products:
            return "/media/catalog/example.json"
        }
    }
}
