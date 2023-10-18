//
//  NearRestaurantUITests.swift
//  NearRestaurantUITests
//
//  Created by Salmdo on 10/17/23.
//

import XCTest

final class TestHomePage: XCTestCase {
    
    private var app : XCUIApplication!
    private var homePagePageObject: HomePagePageObject!
    
    override func setUp() {
        app = XCUIApplication()
        homePagePageObject = HomePagePageObject(app: app)
        continueAfterFailure = false
        app.launch()
    }

    func test_tapOntrendingListView_navigateToTrendingListView(){
        
        let _ = homePagePageObject.trendingListScrollView
        
        
        let trendingText = homePagePageObject.trendingText.firstMatch
        XCTAssertTrue(trendingText.exists)
        
        let textRestaurantName = homePagePageObject.restaurantNameText.firstMatch
        XCTAssertTrue(textRestaurantName.exists)
    }
    
    func test_tapOnTrendingRectangleView_navigateToTopRatedScreen(){
        let _ = homePagePageObject.trendingListScrollView
        let trendingButton = homePagePageObject.trendingButton.firstMatch
        XCTAssertTrue(trendingButton.exists)

        trendingButton.tap()

        let topRatedScreenText = homePagePageObject.topRatedScreenText
        XCTAssertTrue(topRatedScreenText.waitForExistence(timeout: 5))
    }
    
    func test_tapHorizontalRestaurantListView_navigateToRestaurantDetailsScreen(){
        let _ = homePagePageObject.horizontalRestaurantListScrollView
        let button = homePagePageObject.likeIcon.firstMatch
        XCTAssertTrue(button.exists)
        
        button.tap()
        
        let restaurantDetailsScreen = homePagePageObject.bookingButton
        XCTAssertTrue(restaurantDetailsScreen.waitForExistence(timeout: 0.5))
    }
    
    func test_tapCategoryListView_navigateToRestaurantListScreen(){
        let _ = homePagePageObject.categoryListScrollView
        let categoryItem = homePagePageObject.categoryNameText.firstMatch
        
        XCTAssertTrue(categoryItem.exists)
        
        categoryItem.tap()
        
        let button = homePagePageObject.sortByButton
        XCTAssertTrue(button.waitForExistence(timeout: 0.5))
    }
}

final class TestHomePageInteraction: XCTestCase {
    
    func test_clickLikeRestaurant_setTheRestaurantIsFavourite(){
        
    }
}
