//
//  HomeView.swift
//  Appetizers
//
//  Created by rojin on 8.04.2026.
//

import SwiftUI

struct MealsView: View {
    @StateObject var viewmodel = MealsViewmodel()
    @State private var selectedMeal: Meal?
    @State private var isDetail: Bool = false
    var mealString: String

    var body: some View {
        List(viewmodel.meals) { meal in
            MealWidget(meal: meal)
                .onTapGesture {
                    selectedMeal = meal
                    isDetail = true
                }

        }
        .navigationTitle(mealString)
        .disabled(isDetail)
        .blur(radius: isDetail ? 20 : 0)
        .task {
            await viewmodel.getMeals(meal: mealString)
        }

        .overlay{
            if isDetail {
                // Arka planı karartmak için bir Rectangle eklenebilir
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { isDetail = false } // Dışarı basınca kapatma

                MealDetailView(meal: selectedMeal ?? MealMockData.sampleMeal, isDetail: $isDetail)
            }
        }
        .alert(item: $viewmodel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    MealsView(mealString: "Beef")
}
