//
//  ReservationFormValidator.swift
//  NearRestaurantTests
//
//  Created by Salmdo on 7/15/23.
//

import XCTest
@testable import NearRestaurant

final class ReservationFormValidatorTests: XCTestCase {
    var obj : ReservationFormValidator!

    override func setUp() {
        obj = ReservationFormValidator()
    }

    override func tearDown() {
        obj = nil
    }

    func testReservationFormValidator_WhenValidNumberOfPeopleProvided_ShouldReturnTrue(){
        
        //Arrange
        
        //Act
        let isNumberOfPeopleValid = obj.isNumberOfPeopleValid(numberOfPeople: 3)
        
        //Assert
        XCTAssertTrue(isNumberOfPeopleValid, "The isNumberOfPeopleValid() should return TRUE for valid NumberOfPeople but returned FALSE")
    }

    func testReservationFormValidator_WhenInvalidNumberOfPeopleProvided_ShouldReturnFalse(){
        //Arrange
        
        //Act
        let isNumberOfPeopleValid = obj.isNumberOfPeopleValid(numberOfPeople: -4)
        
        //Assert
        XCTAssertFalse(isNumberOfPeopleValid, "The isNumberOfPeopleValid() should return FALSE for invalid NumberOfPeople because it is negative number but returned TRUE")
    }
}
