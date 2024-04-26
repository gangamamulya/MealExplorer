//
//  MealExplorerTests.swift
//  MealExplorerTests
//
//  Created by Amulya Gangam on 4/26/24.
//

import XCTest
@testable import MealExplorer

final class MealExplorerTests: XCTestCase {
    
    func testFetchFoodList() {
        // Arrange
        let mockMealService = MockMealService()
        let viewModel = MealViewModel(mealService: mockMealService)
        let expectation = XCTestExpectation(description: "Fetch food list")
        
        // Act
        viewModel.fetchFoodList()
        
        // Assert
        DispatchQueue.main.async {
            XCTAssertFalse(viewModel.meals.isEmpty, "Fetched meals cannot be empty after fetch operation")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3)
    }
    
    func testEmptyFoodList() {
        // Arrange
        let emptyMockData = MockEmptyMealService()
        let viewModel = MealViewModel(mealService: emptyMockData)
        let expectation = XCTestExpectation(description: "Fetch empty data")
        
        // Act
        viewModel.fetchFoodList()
        
        // Assert
        DispatchQueue.main.async {
            XCTAssertTrue(viewModel.meals.isEmpty, "Fetched meals should be empty as we are fetching from empty data")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3)
    }
    
    func testFetchMealsFailure() {
        // Arrange
        let failureData = MockFailureService()
        let viewModel = MealViewModel(mealService: failureData)
        let expectation = XCTestExpectation(description: "Fetch failure data")
        
        // Act
        viewModel.fetchFoodList()
        
        // Assert
        DispatchQueue.main.async {
            XCTAssertTrue(viewModel.meals.isEmpty, "Data should not be fetched as we are attempting to fetch incorrect data")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3)
    }
}
