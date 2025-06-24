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
        let product1 = Product(id: 1, title: "title1", price: 9.99, description: "description1", category: "category1", image: "", rating: Rating(rate: 3.5, count: 20))
        let product2 = Product(id: 2, title: "title2", price: 10.49, description: "description2", category: "category2", image: "", rating: Rating(rate: 4.7, count: 35))
        
        sessionMock = try XCTUnwrap(URLSessionProtocolMock(products: [product1, product2]))
        dataParser = DataParser()
        sut = ProductListingViewModel()
    }
    
    override func tearDownWithError() throws {
        sessionMock = nil
        dataParser = nil
        sut = nil
    }

    func test_performRequest_shouldReturnData() async {
        await sut.fetchData()
        XCTAssertNotNil(sut.products)
    }
    
    func test_performRequest_ReturnedDataContainsProducts() async throws {
        try await sut.fetchData()
        XCTAssert(!sut.products.isEmpty)
    }

    func test_products_shouldReturnListOfProducts() async throws {
        try await sut.fetchProducts()

        let price = Price(was: "0", then1: "1", then2: "2", now: "3", uom: "4", currency: Currency.gbp)
        let expectedProduct1 = Product(productId: "0", title: "Bosch Serie 2 SMV40C30GB Fully Integrated Dishwasher", code: "0", price: price, image: "", alternativeImageUrls: [])

        let expectedProduct2 = Product(productId: "0", title: "Neff N70 S515T80D1G Fully Integrated Dishwasher", code: "0", price: price, image: "", alternativeImageUrls: [])

        let fetchedProduct1 = try XCTUnwrap(sut.products.first)
        let fetchedProduct2 = try XCTUnwrap(sut.products.last)
        
        XCTAssertEqual(fetchedProduct1.title, expectedProduct1.title)
        XCTAssertEqual(fetchedProduct2.title, expectedProduct2.title)
    }

}
