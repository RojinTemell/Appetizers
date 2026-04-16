//
//  AppetizersViewmodel.swift
//  Appetizers
//
//  Created by rojin on 9.04.2026.
//

import SwiftUI

@Observable
final class CategoryViewModel{
    var categories : [Category] = []
    var alertItem: AlertItem?
    private(set) var state: CategoryViewState = .idle
    let columns  = [GridItem(.adaptive(minimum: 200), spacing: 0)]

    func getCategories() async{
        state = .loading
        guard categories.isEmpty else { return }
        do {
            categories = try await NetworkManager.shared.getCategories()
            print(categories.count)
            state = .success
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
                state = .failure(error.localizedDescription)
            }
        }catch {
            alertItem = AlertContext.unableToComplete
            state = .failure(error.localizedDescription)
        }
    }
}

enum CategoryViewState {
    case idle, loading, success, failure(String)
}
