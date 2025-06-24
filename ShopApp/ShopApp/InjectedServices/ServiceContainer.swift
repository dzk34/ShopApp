//
//  ServiceContainer.swift
//  ShopApp
//
//  Created by Khaled on 23/06/2025.
//

import Foundation

// MARK: Injected Services

private struct RequestManagerKey: InjectedServiceKey {
    static var currentValue: RequestManagerProtocol = RequestManager()
}

private struct APIManagerKey: InjectedServiceKey {
    static var currentValue: APIManagerProtocol = APIManager()
}

private struct DataParserKey: InjectedServiceKey {
    static var currentValue: DataParserProtocol = DataParser()
}

private struct ProductFetcherKey: InjectedServiceKey {
    static var currentValue: ProductFetcherProtocol = ProductFetcher()
}

extension InjectedServiceValues {
    var requestManager: RequestManagerProtocol {
        get { Self[RequestManagerKey.self] }
        set { Self[RequestManagerKey.self] = newValue }
    }
    
    var apiManager: APIManagerProtocol {
        get { Self[APIManagerKey.self] }
        set { Self[APIManagerKey.self] = newValue }
    }
    
    var dataParser: DataParserProtocol {
        get { Self[DataParserKey.self] }
        set { Self[DataParserKey.self] = newValue }
    }
    
    var productFetcher: ProductFetcherProtocol {
        get { Self[ProductFetcherKey.self] }
        set { Self[ProductFetcherKey.self] = newValue }
    }
}
