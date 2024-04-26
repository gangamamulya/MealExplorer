//
//  MealDetailedService.swift
//  MealMate
//
//  Created by Amulya Gangam on 4/24/24.
//

import Foundation

class MealDetailedService: MealDetailedServiceProtocol {
    @Published var mealDetails = [MealDetail]()
    
    func fetchDetailedList(id: String, completion: @escaping ([MealDetail]) -> Void) {
        let urlString = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
        guard let url = URL(string: urlString) else {
            print("Invalid url string \(urlString)")
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Failed to fetch dessert details: \(error)")
            }
            
            guard let data = data else {
                print("No data received from endpoint")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(MealDetailedResponse.self, from: data)
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
