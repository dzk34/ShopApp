//
//  URLSessionProtocol.swift
//  ShopApp
//
//  Created by Khaled on 24/06/2025.
//

import Foundation

protocol URLSessionProtocol {
    func data(
        from url: URL,
        delegate: (URLSessionTaskDelegate)?
    ) async throws -> (Data, URLResponse)
    
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}
