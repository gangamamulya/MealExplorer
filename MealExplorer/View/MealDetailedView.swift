//
//  MealDetailedView.swift
//  MealMate
//
//  Created by Amulya Gangam on 4/19/24.
//

import SwiftUI

struct MealDetailedView: View {
    let mealId: String
    @ObservedObject var mealDetailViewModel = MealDetailedViewModel()
    
    var body: some View {
        NavigationView {
            
            List(mealDetailViewModel.mealDetails) { mealDetail in
                VStack(alignment: .leading, spacing: 10) {
                    Text(mealDetail.strMeal)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    Divider()
                    
                    Text("Instructions for Recipe")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.top, 16)
                        .padding(.bottom, 16)
                    
                    Text(mealDetail.strInstructions)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 16)
                    
                    Divider()
                    
                    Text("Ingredients")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.top, 16)
                        .padding(.bottom, 16)
                    
                    ForEach(1...20, id: \.self){ index in
                        if let ingredient = mealDetail.getIngredient(at: index), let measurement = mealDetail.getMeasure(at: index){
                            HStack{
                                Text(ingredient)
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text(measurement)
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                    }
                    
                }
                .padding(16)
                .background(Color.pink.opacity(0.1))
                .cornerRadius(16)
                .shadow(color: Color.pink.opacity(0.5), radius: 3, x: 0, y: 0)
                .listRowSeparator(.hidden)
                
            }
            
            .listStyle(PlainListStyle())
            .onAppear {
                mealDetailViewModel.fetchDetailedList(id: mealId)
            }
        }
        
    }
}

extension MealDetail {
    func getIngredient(at index: Int) -> String? {
        let propertyName = "strIngredient\(index)"
        guard let ingredient = Mirror(reflecting: self).children.first(where: { $0.label == propertyName })?.value as? String, !ingredient.isEmpty else { return nil }
        
        return ingredient
        
    }
    
    func getMeasure(at index: Int) -> String? {
        let propertyName = "strMeasure\(index)"
        guard let measure = Mirror(reflecting: self).children.first(where: { $0.label == propertyName})?.value as? String, !measure.isEmpty else { return nil }
        return measure
    }
}


#Preview {
    MealDetailedView(mealId: "53049")
}
