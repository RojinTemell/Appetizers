//
//  Meal.swift
//  Appetizers
//
//  Created by rojin on 10.04.2026.
//

import Foundation

struct MealsRespponse: Codable {
    let meals: [Meal]
}

struct Meal: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let strYoutube: String
    var id: String {
        return idMeal
    }
}

