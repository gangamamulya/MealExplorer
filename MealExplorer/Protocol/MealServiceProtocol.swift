//
//  MealServiceProtocol.swift
//  MealMate
//
//  Created by Amulya Gangam on 4/24/24.
//

import Foundation

protocol MealServiceProtocol {
    func fetchFoodList(completion: @escaping ([Meal]) -> Void)
}

