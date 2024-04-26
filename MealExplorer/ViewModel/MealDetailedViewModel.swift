//
//  MealDetailedViewModel.swift
//  MealMate
//
//  Created by Amulya Gangam on 4/20/24.
//

import Foundation

class MealDetailedViewModel: ObservableObject {
    @Published var mealDetails = [MealDetail]()
    private let mealDetailService: MealDetailedServiceProtocol
    
    init(mealDetailService: MealDetailedServiceProtocol = MealDetailedService()) {
        self.mealDetailService = mealDetailService
    }
    
    func fetchDetailedList(id: String) {
        mealDetailService.fetchDetailedList(id: id) {[weak self] fetchedMealDetails in
            self?.mealDetails = fetchedMealDetails
            
        }
    }
    
}
