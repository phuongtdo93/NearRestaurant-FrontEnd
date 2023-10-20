//
//  PageObjectHomePage.swift
//  NearRestaurantUITests
//
//  Created by Salmdo on 10/18/23.
//

import Foundation
import XCTest


class HomePagePageObject {
    var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var trendingListScrollView: XCUIElement {
        app.scrollViews["idTrendingListView"]
    }
    
    var trendingText: XCUIElement {
        app.staticTexts["TRENDING"]
    }
    
    var restaurantNameText: XCUIElement {
        app.staticTexts["idRestaurantName"]
    }
    
    var trendingButton: XCUIElement {
        app.buttons["SEE ALL"]
    }
    
    var topRatedScreenText: XCUIElement {
        app.staticTexts["Restaurants"]
    }
    
    var horizontalRestaurantListScrollView: XCUIElement {
        app.scrollViews["idHorizontalRestaurantListView"]
    }
    
    var likeIcon: XCUIElement {
        app.buttons["idLikeIconRestaurantItemVerticalView"]
    }
    
    var bookingButton: XCUIElement {
        app.buttons["BOOKING"]
    }
    
    var categoryListScrollView: XCUIElement {
        app.scrollViews["idCategoryListView"]
    }
    
    var categoryNameText: XCUIElement {
        app.staticTexts["idCategoryName"]
    }
    
    var sortByButton: XCUIElement {
        app.buttons["SORT BY"]
    }
}
