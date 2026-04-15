//
//  AppetizersViewmodel.swift
//  Appetizers
//
//  Created by rojin on 9.04.2026.
//

import SwiftUI
import Combine

final class CategoryViewModel:ObservableObject {
    @Published var categories : [Category] = []
    @Published var alertItem: AlertItem?

    let columns  = [GridItem(.adaptive(minimum: 200), spacing: 0)]

    func getCategories() async{
        guard categories.isEmpty else { return }
        do {
            categories = try await NetworkManager.shared.getCategories()
            print(categories.count)
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
