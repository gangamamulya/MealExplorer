//
//  MockDetailedEmptyMealService.swift
//  MealMateTests
//
//  Created by Amulya Gangam on 4/25/24.
//

import Foundation
@testable import MealExplorer

class MockDetailedEmptyMealService: MealDetailedServiceProtocol {
    func fetchDetailedList(id: String, completion: @escaping ([MealDetail]) -> Void) {
        var mock: [MealDetail] = []
        completion(mock)
    }
}
