//
//  RequestManagerTests.swift
//  ShopAppTests
//
//  Created by Khaled on 24/06/2025.
//

import XCTest

@testable import ShopApp

final class RequestManagerTests: XCTestCase {
    private var requestManager: RequestManagerMock?
    
    override func setUp() {
        super.setUp()
        requestManager = RequestManagerMock(apiManager: APIManagerMock(), dataParser: DataParser())
    }
    
    func test_perform_request_should_return_products() async throws {
        guard let products: [Product] = try await requestManager?.perform(ProductsRequestMock.fetchProducts)
        else {
            XCTFail("Failed to get data from the request manager")
            return
        }
        
        let first = products.first
        let last = products.last
        
        XCTAssertEqual(first?.id, 1)
        XCTAssertEqual(first?.title, "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops")
        
        XCTAssertEqual(last?.id, 20)
        XCTAssertEqual(last?.title, "DANVOUY Womens T Shirt Casual Cotton Short")
    }
}
