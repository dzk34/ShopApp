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
    var dataParser: DataParserProtocol!

    override func setUpWithError() throws {
        dataParser = DataParser()
        sut = ProductListingViewModel()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }

    func test_performRequest_shouldReturnData() async {
        await sut.fetchData()
        XCTAssertNotNil(sut.products)
    }
}
