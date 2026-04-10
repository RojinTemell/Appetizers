//
//  AppetizersViewmodel.swift
//  Appetizers
//
//  Created by rojin on 9.04.2026.
//

import Foundation
import Combine

final class AppetizersViewmodel:ObservableObject {

    @Published var appetizers : [Appetizer] = []
    @Published var categories : [Category] = []
    @Published var meals : [Meal] = []


    func getCategories() async{
        do {
            categories = try await NetworkManager.shared.getCategories()
            print(categories.count)
        }catch {
            print("Kategoriler alınırken hata oluştu: \(error.localizedDescription)")

        }
    }

    func getMeals(meal:String)async{
        guard meals.isEmpty else { return }
        do{
            meals = try await NetworkManager.shared.getMeals(meal: meal)
            print(meals.count)
        }catch{
            print("meals alınırken hata oluştu: \(error.localizedDescription)")

        }
    }


}
