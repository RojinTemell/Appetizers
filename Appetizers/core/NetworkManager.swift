//
//  NetworkManager.swift
//  Appetizers
//
//  Created by rojin on 9.04.2026.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    static let baseUrl = "https://www.themealdb.com/api/json/v1/1/"
    private let categories = baseUrl+"categories.php"
    private let meals = baseUrl+"search.php?s="
    private let meal = baseUrl+"lookup.php?i="
    private init(){}


    func getCategories() async throws ->[Category] {
        guard let url = URL(string:categories) else {
            throw APError.invalidURL
        }
        let (data ,response) = try await URLSession.shared.data(for: URLRequest(url: url))

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw APError.invalidResponse
        }
        do {
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(CategoryResponse.self, from: data)
            return decoded.categories
        }catch {
            throw APError.invalidData
        }

    }
    func getMeals(meal :String) async throws -> [Meal] {
        guard let url = URL(string :meals + meal) else {
            throw APError.invalidURL
        }

        let (data,response) = try await URLSession.shared.data(for: URLRequest(url :url))

        guard let response = response as? HTTPURLResponse ,
              response.statusCode == 200 else{
            throw APError.invalidResponse
        }
        do{
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(MealsRespponse.self, from: data)
            return decoded.meals
        }catch {
            throw APError.invalidData
        }

    }

}
