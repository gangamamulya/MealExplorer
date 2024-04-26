//
//  MealViewModel.swift
//  MealMate
//
//  Created by Amulya Gangam on 4/19/24.
//

import Foundation

class MealViewModel: ObservableObject {
    
    @Published var meals = [Meal]()
    private let mealService: MealServiceProtocol
    
    init(mealService: MealServiceProtocol = MealService()) {
        self.mealService = mealService
    }
    
    func fetchFoodList() {
        mealService.fetchFoodList { [weak self] fetchedMeals in
            DispatchQueue.main.async {
                self?.meals = fetchedMeals
            }
            
        }
        
    }
}
