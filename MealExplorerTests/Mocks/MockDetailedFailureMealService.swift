//
//  MockDetailedFailureMealService.swift
//  MealMateTests
//
//  Created by Amulya Gangam on 4/25/24.
//

import Foundation
@testable import MealExplorer

class MockDetailedFailureMealService: MealDetailedServiceProtocol {
    func fetchDetailedList(id: String, completion: @escaping ([MealDetail]) -> Void) {
        let failureData: [Any] = [2.3, 4.0,5.6, 8, 9.0, 11.2, 8.9, "hey", 5.7, 5.6,2.3, 4.0,5.6, 8, 9.0, 11.2, 8.9, "hey", 5.7, 5.6,2.3, 4.0,5.6, 8, 9.0, 11.2, 8.9, "hey", 5.7, 5.6,2.3, 4.0,5.6, 8, 9.0, 11.2, 8.9, "hey", 5.7, 5.6,3.4, 4.5, 6.7] 
        if let incorrectData = failureData as? [MealDetail] {
            completion(incorrectData)
        }
        
    }
}
