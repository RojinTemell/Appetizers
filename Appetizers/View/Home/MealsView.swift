//
//  HomeView.swift
//  Appetizers
//
//  Created by rojin on 8.04.2026.
//

import SwiftUI

struct MealsView: View {
    @StateObject var viewmodel = MealsViewmodel()
    var mealString: String

    var body: some View {
        List(viewmodel.meals) { meal in
            MealWidget(meal: meal)
                .onTapGesture {
                    viewmodel.selectedMeal = meal
                    viewmodel.isDetail     = true
                }

        }
        .navigationTitle(mealString)
        .navigationBarBackButtonHidden(viewmodel.isDetail)
        .disabled(viewmodel.isDetail)
        .blur(radius: viewmodel.isDetail ? 20 : 0)
        .task {
            await viewmodel.getMeals(meal: mealString)
        }

        .overlay{
            if viewmodel.isDetail {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { viewmodel.isDetail = false }
                MealDetailView(meal: viewmodel.selectedMeal ?? MealMockData.sampleMeal, isDetail: $viewmodel.isDetail).padding(.bottom, 100)
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
