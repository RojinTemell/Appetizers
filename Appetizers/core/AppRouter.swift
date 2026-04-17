//
//  AppRouter.swift
//  Appetizers
//
//  Created by rojin on 12.04.2026.
//

import Observation
import SwiftUI


@Observable
final class AppRouter {
    var selectedTab: Tab = .category
    var categoryPath     = NavigationPath()
    var accountPath      = NavigationPath()
    var orderPath        = NavigationPath()

    func navigateInStore(to route: OrderRoute) {
        orderPath.append(route)
    }
    func navigateInHome(to route: CategoryRoute) {
        categoryPath.append(route)
    }
    func popToOrderRoute() {
        orderPath = NavigationPath()
    }
    func popHome() {
        guard !categoryPath.isEmpty else { return }
        categoryPath.removeLast()
    }
    func goToMealDetail(meal: Meal,mealString:String) {
        selectedTab = .category
        categoryPath = NavigationPath()
        categoryPath.append(CategoryRoute.meals(meal:mealString ))
        categoryPath.append(CategoryRoute.mealDetail(meal: meal))
    }
    func goToProductDetail() {
        selectedTab = .order
        orderPath = NavigationPath()
        orderPath.append(OrderRoute.products)
        orderPath.append(OrderRoute.detail)
    }
    func popHomeToRoot() {
        categoryPath = NavigationPath()  // removeLast yerine direkt sıfırla
    }

    func popAccountToRoot() {
        guard !accountPath.isEmpty else { return }
        accountPath.removeLast(accountPath.count)
    }

}
