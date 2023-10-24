//
//  ReservationFormValidator.swift
//  NearRestaurantTests
//
//  Created by Salmdo on 7/15/23.
//

import XCTest
@testable import NearRestaurant

fileprivate struct MockReservationAlwaysSuccess: ReservationProtocol {
    
    func createReservation(reservation: NearRestaurant.Reservation, completion: @escaping ((Result<NearRestaurant.Reservation?, NearRestaurant.ServiceError>) -> Void)) {
        completion(.success(nil))
    }
}

fileprivate struct MockReservationAlwaysFailed: ReservationProtocol {
    
    func createReservation(reservation: NearRestaurant.Reservation, completion: @escaping ((Result<NearRestaurant.Reservation?, NearRestaurant.ServiceError>) -> Void)) {
        
        completion(.failure(ServiceError.invalidUrl))
    }
}



final class CreateReservationViewModelTest: XCTestCase {
    var objectVMAlwaysFailed: CreateReservationViewModel!
    var objectVMAlwaysSuccess: CreateReservationViewModel!

    override func setUp() {
        objectVMAlwaysSuccess = CreateReservationViewModel(reservationService: MockReservationAlwaysSuccess())
        objectVMAlwaysFailed = CreateReservationViewModel(reservationService: MockReservationAlwaysFailed())
    }

    override func tearDown() {
        objectVMAlwaysSuccess = nil
        objectVMAlwaysFailed = nil
    }

    func testNumberOfPersons_IsNillValue_ReturnFailure() {
        objectVMAlwaysSuccess?.numberOfPersons = ""
        objectVMAlwaysSuccess?.createReservation()
        
        XCTAssertEqual(objectVMAlwaysSuccess?.reservationCreatedResult, ReserveStatus.Fail)
    }
    
    func testNumberOfPersons_IsNegative_ReturnFailure() {
        objectVMAlwaysSuccess?.numberOfPersons = "-4 People"
        objectVMAlwaysSuccess?.createReservation()
        
        XCTAssertEqual(objectVMAlwaysSuccess?.reservationCreatedResult, ReserveStatus.Fail)
    }
    
    func testCreateReservation_ReturnFailure() {
        objectVMAlwaysFailed?.numberOfPersons = "4 People"
        
        let expectation = self.expectation(description: "Fetch function return failure")
        objectVMAlwaysFailed?.createReservation()
        
        DispatchQueue.main.async {
            XCTAssertEqual(self.objectVMAlwaysFailed?.reservationCreatedResult, ReserveStatus.Fail)
            
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testCreateReservation_ReturnSuccess() {
        objectVMAlwaysSuccess?.numberOfPersons = "4 People"
        
        let expectation = self.expectation(description: "Fetch function return success")
        
        objectVMAlwaysSuccess?.createReservation()
        
        DispatchQueue.main.async {
            XCTAssertEqual(self.objectVMAlwaysSuccess?.reservationCreatedResult, .Success)
            expectation.fulfill()

        }
        self.wait(for: [expectation], timeout: 5)
    }
}
