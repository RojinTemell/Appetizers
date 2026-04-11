//
//  MealViewModel.swift
//  Appetizers
//
//  Created by rojin on 11.04.2026.
//

import SwiftUI
import Combine

final class MealsViewmodel:ObservableObject {
    @Published var meals : [Meal] = []
    @Published var alertItem: AlertItem?
    @Published var isDetail :Bool = false
    @Published var selectedMeal :Meal?


    func getMeals(meal:String)async{
        guard meals.isEmpty else { return }
        do{
            meals = try await NetworkManager.shared.getMeals(meal: meal)
        }catch let error as APError{
            switch error {
            case .invalidURL:
                alertItem = AlertContext.invalidURL
            case .invalidResponse:
                alertItem = AlertContext.invalidResponse
            case .invalidData:
                alertItem = AlertContext.invalidData
            case .unableToComplete:
                alertItem = AlertContext.unableToComplete
            }
        }catch {
            alertItem = AlertContext.unableToComplete
        }
    }
}
