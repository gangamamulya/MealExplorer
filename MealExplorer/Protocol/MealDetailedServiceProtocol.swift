//
//  MealDetailedServiceProtocol.swift
//  MealMate
//
//  Created by Amulya Gangam on 4/24/24.
//

import Foundation

protocol MealDetailedServiceProtocol {
    func fetchDetailedList(id: String, completion: @escaping ([MealDetail]) -> Void)
}

