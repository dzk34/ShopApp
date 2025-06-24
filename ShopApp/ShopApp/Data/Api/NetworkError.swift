//
//  NetworkError.swift
//  ShopApp
//
//  Created by Khaled on 22/06/2025.
//

import Foundation

public enum NetworkError: LocalizedError {
    case failedResponse
    case failedDecoding
    case invalidUrl
    case invalidServerResponse
    case noData
    
    public var customMessage: String {
        switch self {
        case .failedResponse:
            return "Error: Failed response"
        case .failedDecoding:
            return "Error: failed decoding"
        case .invalidUrl:
            return "Error: invalid URL"
        case .invalidServerResponse:
            return "Error: invalid server response"
        case .noData:
            return "Error: no data found"
        }
    }
}

enum HTTPStatusCode: Int {
    case success = 200
    case created = 201
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case internalServerError = 500
    case unknown
}
