//
//  MockFailureService.swift
//  MealMateTests
//
//  Created by Amulya Gangam on 4/25/24.
//

import Foundation
@testable import MealExplorer

class MockFailureService: MealServiceProtocol {
    func fetchFoodList(completion: @escaping ([Meal]) -> Void) {
        let incorrectFormat: Any = [2.4,3.1, 5.2]
        if let meals = incorrectFormat as? [Meal] {
            completion(meals)
        } else {
            print("Error: Incorrect data format")
        }
    }
}
