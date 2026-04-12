//
//  AppetizersListView.swift
//  Appetizers
//
//  Created by rojin on 12.04.2026.
//

import SwiftUI

struct AppetizersListView: View {
    @StateObject var viewModel =  MealsViewmodel()
    var body: some View {
        ZStack {
//            NavigationView {
                List(viewModel.meals) { meal in
                    MealWidget(meal: meal)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.selectedMeal = meal
                            viewModel.isDetail = true
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .listStyle(.plain)
                .disabled(viewModel.isDetail)
//            }
            .task {
                await viewModel.getMeals(meal: "Beef" )
            }
            .blur(radius: viewModel.isDetail ? 20 : 0)

            if viewModel.isDetail {
                MealDetailView(meal: viewModel.selectedMeal!, isDetail: $viewModel.isDetail)

            }

            
        }

    }
}

#Preview {
    AppetizersListView()
}
