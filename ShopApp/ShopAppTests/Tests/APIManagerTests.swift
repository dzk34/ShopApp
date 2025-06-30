//
//  APIManagerTests.swift
//  ShopAppTests
//
//  Created by Khaled on 24/06/2025.
//

import XCTest

@testable import ShopApp

final class APIManagerTests: XCTestCase {

    var sut: APIManagerProtocol!
    var sessionMock: URLSessionProtocolMock!
    var dataParser: DataParserProtocol!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let product1 = Product(id: 1, title: "title1", price: 9.99, description: "description1", category: "category1", image: "", rating: Rating(rate: 3.5, count: 20))
        let product2 = Product(id: 2, title: "title2", price: 10.49, description: "description2", category: "category2", image: "", rating: Rating(rate: 4.7, count: 35))
        
        sessionMock = try XCTUnwrap(URLSessionProtocolMock(products: [product1, product2]))
        sut = APIManagerMock(urlSession: sessionMock)
        dataParser = DataParser()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sessionMock = nil
        dataParser = nil
        sut = nil
    }
    
    func test_performRequest_shouldReturnData() async throws {
        let request = ProductsRequestMock.fetchProducts
        let data = try await sut.perform(request)
        XCTAssertNotNil(data)
    }
 
//    func test_products_shouldFetchFromCorrectURL() async throws {
//        let request = ProductsRequestMock.fetchProducts
//        _ = try await sut.perform(request)
//        let expectedURL = try XCTUnwrap(URL(string: "https://fakestoreapi.com/products"))
//        XCTAssertEqual(sessionMock.dataURL, expectedURL)
//    }
}
