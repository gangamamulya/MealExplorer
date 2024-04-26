//
//  MealService.swift
//  MealMate
//
//  Created by Amulya Gangam on 4/24/24.
//

import Foundation

class MealService: MealServiceProtocol {
    
    @Published var meals = [Meal]()
    
    func fetchFoodList(completion: @escaping ([Meal])-> Void) {
        let urlString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        guard let url = URL(string: urlString) else {
            print("Invalid url string: \(urlString)")
            return
        }
        URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            if let error = error {
                print("Failed to fetch dessers: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received from the endpoint: \(data)")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(MealResponse.self, from: data)
                print("decoded data is \(decodedData)")
                DispatchQueue.main.async {
                    completion(decodedData.meals)
                }
            }
            catch {
                print("error decoding the data: \(error)")
            }
        }.resume()
    }
}
