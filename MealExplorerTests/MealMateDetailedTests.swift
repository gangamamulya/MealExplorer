//
//  MealMateDetailedTests.swift
//  MealMateTests
//
//  Created by Amulya Gangam on 4/25/24.
//

import XCTest
@testable import MealExplorer

final class MealMateDetailedTests: XCTestCase {
    
    func testFetchMealDetails() {
        //Arrange
        let mockService = MockDetailedService()
        let viewModel = MealDetailedViewModel(mealDetailService: mockService)
        let expectation = XCTestExpectation(description: "Fetch meal details")
        
        //Act
        viewModel.fetchDetailedList(id: "53049")
        
        //Assert
        DispatchQueue.main.async {
            XCTAssertFalse(viewModel.mealDetails.isEmpty)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3)
        
    }
    
    func testMealDetailsWithNilData() {
        //Arrange
        let mockService = MockDetailedEmptyMealService()
        let viewModel = MealDetailedViewModel(mealDetailService: mockService)
        let expectation = XCTestExpectation(description: "Fetch empty Meal details")
        
        //Act
        viewModel.fetchDetailedList(id: "53049")
        
        //Assert
        DispatchQueue.main.async {
            XCTAssertTrue(viewModel.mealDetails.isEmpty, "Meal details can't be fetched as we are fetching from empty data")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3)
    }
    
    func testMealDetailsWithInvalidData() {
        //Arrange
        let mockService = MockDetailedFailureMealService()
        let viewModel = MealDetailedViewModel(mealDetailService: mockService)
        let expectation = XCTestExpectation(description: "fetch invalid meal details")
        
        //Act
        viewModel.fetchDetailedList(id: "53049")
        
        //Assert
        DispatchQueue.main.async {
            XCTAssertTrue(viewModel.mealDetails.isEmpty, "Meal details can't be feteched as we are fetching from invalid data")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3)
    }
    
}
