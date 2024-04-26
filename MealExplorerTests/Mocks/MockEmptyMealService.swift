//
//  MockEmptyMealService.swift
//  MealMateTests
//
//  Created by Amulya Gangam on 4/25/24.
//

import Foundation
@testable import MealExplorer

class MockEmptyMealService: MealServiceProtocol {
    func fetchFoodList(completion: @escaping ([Meal]) -> Void) {
        var mock: [Meal] = []
        completion(mock)
    }
}
