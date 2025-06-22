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

    override func setUpWithError() throws {
        sut = ProductListingViewModel()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }

    func test_performRequest_shouldReturnData()  {
        sut.fetchData()
        XCTAssertNotNil(sut.product)
    }
}
