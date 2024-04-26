//
//  MealResponse.swift
//  MealMate
//
//  Created by Amulya Gangam on 4/19/24.
//

import Foundation

struct MealResponse: Decodable {
    var meals: [Meal]
}

struct Meal: Decodable, Identifiable {
    var strMeal: String
    var strMealThumb: String
    var idMeal: String
    var id: String { idMeal }
}
