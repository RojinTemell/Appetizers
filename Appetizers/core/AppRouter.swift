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
    var categoryPath    = NavigationPath()
    var accountPath = NavigationPath()
    var orderPath   = NavigationPath()

    func pushHome(_ route: CategoryRoute) {
        categoryPath.append(route)
    }

    func popHome() {
        guard !categoryPath.isEmpty else { return }
        categoryPath.removeLast()
    }

    func popHomeToRoot() {
        categoryPath.removeLast(categoryPath.count)
    }

    func pushAccount(_ route: AccountRoute) {
        accountPath.append(route)
    }

    func popAccountToRoot() {
        accountPath.removeLast(accountPath.count)
    }
    func pushOrder(_ route: OrderRoute) {
        orderPath.append(route)
    }

    func switchTab(to tab: Tab, resetStack: Bool = false) {
        selectedTab = tab
        if resetStack {
            switch tab {
            case .category:    popHomeToRoot()
            case .account: popAccountToRoot()
            case .order:   orderPath.removeLast(orderPath.count)
            }
        }
    }
}
