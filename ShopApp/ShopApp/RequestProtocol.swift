//
//  RequestProtocol.swift
//  ShopApp
//
//  Created by Khaled on 22/06/2025.
//

import Foundation

enum RequestType: String {
    case get
    case post
    case put
    case patch
    case delete
}

protocol RequestProtocol {
    var path: String { get }
}

extension RequestProtocol {
    var host: String {
        APIConstants.host
    }
    
    var scheme: String {
        APIConstants.scheme
    }
    
    func createURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: URL(string: "url"))
        return urlRequest
    }
}
