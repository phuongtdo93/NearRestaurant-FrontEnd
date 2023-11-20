//
//  TestUtilityPushFunc.swift
//  NearRestaurantTests
//
//  Created by Salmdo on 10/22/23.
//

import XCTest
@testable import NearRestaurant

final class UtilityPushFuncTest: XCTestCase {
    var config: URLSessionConfiguration!
    var urlSession: URLSession!
    var utilitiService: NetworkingServiceToken<TestCodableObject>!
    
    
    override func setUp() {
        config = URLSessionConfiguration.ephemeral
        config?.protocolClasses = [MockUrlSession.self]
        urlSession = URLSession(configuration: config!)
        utilitiService = NetworkingServiceToken<TestCodableObject>(urlSession: urlSession!, token: "token")
    }
    
    override func tearDown() {
        urlSession = nil
        config = nil
        MockUrlSession.responseData = nil
        MockUrlSession.responseError = nil
        utilitiService = nil
    }
    
    struct TestCodableObject: Codable, Equatable {
        let name: String
    }
    
    
    func testPushData_invalidInput_ReturnFailure(){
        //Arrage
        MockUrlSession.responseError = ServiceError.invalidUrl
        
        let utiliTiService = NetworkingServiceToken<TestCodableObject>(urlSession: urlSession!, token: "")
        let expectation = self.expectation(description: "PUSH reservations is failed because of invalidUrl")
        
        //Act
        utiliTiService.pushData(apiEndpoint: "",
                                input:TestCodableObject(name: "")) { result in
            
            //Assert
            switch result {
            case .success(_):
                XCTAssertTrue(true)
            case .failure(let err):
                XCTAssertEqual(ServiceError.invalidUrl, err)
            }
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 10)
    }
    
    func testPushData_notAvailableData_ReturnFailure(){
        MockUrlSession.responseError = ServiceError.notAvailableData
//        
//        let utilitiService = UtilityService<TestCodableObject>(urlSession: urlSession!)
        let expectaion = self.expectation(description: "PUSH reservations is failed because of cannotEncodeData")
        
        utilitiService.pushData(apiEndpoint: APIEndpoint.reservations, input: TestCodableObject(name: "")) { result in
            //Assert
            switch result {
            case .success(_):
                XCTAssertTrue(true)
            case .failure(let err):
                XCTAssertEqual(ServiceError.notAvailableData, err)
            }
            expectaion.fulfill()
        }
        
        self.wait(for: [expectaion], timeout: 10)
    }
    
    func testPushData_cannotDecodeResult_ReturnFailure(){
        MockUrlSession.responseData = nil
        
//        let utilitiService = UtilityService<TestCodableObject>(urlSession: urlSession!)
        let expectaion = self.expectation(description: "PUSH reservations is failed because of cannotDecodeResult")
        
        utilitiService.pushData(apiEndpoint: APIEndpoint.reservations, input: TestCodableObject(name: "")) { result in
            switch result {
            case .success(_):
                XCTAssertTrue(true)
            case .failure(let err):
                XCTAssertEqual(err, ServiceError.invalidDataStructure)
            }
            expectaion.fulfill()
        }
        
        self.wait(for: [expectaion], timeout: 10)
    }
    
    func testPushData_validInput_ResultSuccess(){
        let expectedResult = "{\"name\":\"Category\"}"
        MockUrlSession.responseData = expectedResult.data(using: .utf8)
//        
//        let utilitiService = UtilityService<TestCodableObject>(urlSession: urlSession!)
        let expectaion = self.expectation(description: "PUSH reservations success")
        
        let objInput = TestCodableObject(name: "Category")
        utilitiService.pushData(apiEndpoint: APIEndpoint.reservations, input: objInput) { result in
            switch result {
            case .success(let res):
                XCTAssertEqual(res, objInput)
            case .failure(_):
                XCTAssertFalse(false)
            }
            expectaion.fulfill()
        }
        self.wait(for: [expectaion], timeout: 10)
    }
}
