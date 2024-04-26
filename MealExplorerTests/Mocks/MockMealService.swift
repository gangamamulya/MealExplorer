//
//  MockMealService.swift
//  MealMateTests
//
//  Created by Amulya Gangam on 4/24/24.
//

import Foundation
@testable import MealExplorer

class MockMealService: MealServiceProtocol {
    func fetchFoodList(completion: @escaping ([Meal]) -> Void) {
        let mockSchools = [Meal(strMeal: "Apam",
                               strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
                               idMeal: "53049")]
        completion(mockSchools)
    }
    
}

