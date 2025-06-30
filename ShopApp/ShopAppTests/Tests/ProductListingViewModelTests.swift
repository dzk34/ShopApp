//
//  ProductListingViewModelTests.swift
//  ShopAppTests
//
//  Created by Khaled on 22/06/2025.
//

import XCTest

@testable import ShopApp

final class ProductListingViewModelTests: XCTestCase {
    var sut: ProductListingViewModel!
    var apiManager: APIManagerProtocol!
    var sessionMock: URLSessionProtocolMock!
    var dataParser: DataParserProtocol!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let product1 = Product(id: 1, title: "title1", price: 9.99, description: "description1", category: "category1", image: "", rating: Rating(rate: 3.5, count: 20))
        let product2 = Product(id: 2, title: "title2", price: 10.49, description: "description2", category: "category2", image: "", rating: Rating(rate: 4.7, count: 35))
        
        sessionMock = try XCTUnwrap(URLSessionProtocolMock(products: [product1, product2]))
        dataParser = DataParser()
        sut = ProductListingViewModel()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sessionMock = nil
        dataParser = nil
        sut = nil
    }

    func test_performRequest_shouldReturnData() async {
        try? await sut.fetchData()
        XCTAssertNotNil(sut.products)
    }
    
    func test_performRequest_ReturnedDataContainsProducts() async throws {
        try await sut.fetchData()
        XCTAssert(!sut.products.isEmpty)
    }

    func test_products_shouldReturnListOfProducts() async throws {
        try await sut.fetchData()

        let expectedProduct1 = Product(id: 1, title: "title1", price: 9.99, description: "description1", category: "category1", image: "", rating: Rating(rate: 3.5, count: 20))

        let expectedProduct2 = Product(id: 2, title: "title2", price: 10.49, description: "description2", category: "category2", image: "", rating: Rating(rate: 4.7, count: 35))

        let fetchedProduct1 = try XCTUnwrap(sut.products.first)
        let fetchedProduct2 = try XCTUnwrap(sut.products.last)
        
        XCTAssertEqual(fetchedProduct1.title, expectedProduct1.title)
        XCTAssertEqual(fetchedProduct2.title, expectedProduct2.title)
    }

}
