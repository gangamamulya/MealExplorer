//
//  MealView.swift
//  MealMate
//
//  Created by Amulya Gangam on 4/19/24.
//

import SwiftUI

struct MealView: View {
    @ObservedObject var viewModel = MealViewModel()
    @State var selectedMeal: Meal?
    var body: some View {
        NavigationView {
            List(viewModel.meals) { meal in
                MealRow(meal: meal)
                    .onTapGesture {
                        self.selectedMeal = meal
                    }
                
                    .listRowBackground(Color.white)
                    .listRowSeparator(.hidden)
                
            }
            .listStyle(PlainListStyle())
            .onAppear {
                viewModel.fetchFoodList()
            }
            .navigationTitle("Dessert Menu")
            
            .sheet(item: $selectedMeal){ meal in
                MealDetailedView(mealId: meal.idMeal)
                
            }
            
        }
    }
}

struct MealRow: View {
    var meal: Meal
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(meal.strMeal)
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
            }
            .padding(.leading, 16)
            Spacer()
            AsyncImage(url: URL(string: meal.strMealThumb)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure:
                    Image(systemName: "photo.on.rectangle")
                        .resizable()
                        .scaledToFit()
                case .empty:
                    ProgressView()
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 120, height: 120)
            .clipped()
        }.accessibilityIdentifier("MealRow")
        
            .frame(height: 120)
            .background(Color.pink.opacity(0.1))
            .cornerRadius(12)
            .shadow(color: Color.pink.opacity(0.3), radius: 3, x: 0, y: 0)
        
    }
    
    
}


#Preview {
    MealView()
}
