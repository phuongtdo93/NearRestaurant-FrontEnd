//
//  testCategoryService.swift
//  NearRestaurantTests
//
//  Created by Salmdo on 7/16/23.
//

import XCTest
@testable import NearRestaurant

final class testRestaurantService: XCTestCase {
    var config: URLSessionConfiguration?
    var urlSession: URLSession?

    override func setUp() {
        config = URLSessionConfiguration.ephemeral
        config?.protocolClasses = [MockUrlSession.self]
        urlSession = URLSession(configuration: config!)
        
    }

    override func tearDown() {
        urlSession = nil
        config = nil
        MockUrlSession.responseData = nil
        MockUrlSession.responseError = nil
        
    }

    func testRestaurantService_fetchGenericData_ReturnCorrectData() {
        //Arrange
        let expectedResultStr = "[{\"_id\":\"123\",\"name\":\"Category\"}]"
        MockUrlSession.responseData = expectedResultStr.data(using: .utf8)
        
        let utilityService = UtilityService<NearRestaurant.Category>(urlSession: urlSession!)
        
        let expectedResult = Category(id: "123", name: "Category")
        let expectation = self.expectation(description: "Fetch function return data")
        //Act
        utilityService.fetchData(apiEndpoint: NearRestaurantEndpoint.getAllCategories) { result in
            //Assert
            switch result {
            case .success(let res):
                XCTAssertEqual(res, [expectedResult], "Fetch function return correct data but returning wrong data")
            case .failure(let err):
                XCTAssertNil(err)
                
            }
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testRestaurantService_invalidURLProvided_ReturnFailure() {
        //Arrange
        MockUrlSession.responseError = CategoryError.invalidUrl
        
        
        let utilityService = UtilityService<NearRestaurant.Category>(urlSession: urlSession!)
        
        let expectation = self.expectation(description: "Fetch function return error")
        //Act
        utilityService.fetchData(apiEndpoint: "") { result in
            //Assert
            switch result {
            case .success(let res):
                XCTAssertEqual(res, [])
            case .failure(let err):
                XCTAssertEqual(err, CategoryError.invalidUrl, "Fetch function return error but it does not")
                
            }
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    func testRestaurantService_invalidDataStructureReturned_ReturnFailure() {
        //Arrange
        let expectedResultStr = "[{\"id\":\"123\",\"name\":\"Category\"}]"
        MockUrlSession.responseData = expectedResultStr.data(using: .utf8)
        
        let utilityService = UtilityService<NearRestaurant.Category>(urlSession: urlSession!)
        
        let expectation = self.expectation(description: "Fetch function return data")
        //Act
        utilityService.fetchData(apiEndpoint: NearRestaurantEndpoint.getAllCategories) { result in
            //Assert
            switch result {
            case .success(let res):
                XCTAssertEqual(res, [])
            case .failure(let err):
                XCTAssertEqual(err, CategoryError.invalidDataStructure)
                
            }
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }

}
