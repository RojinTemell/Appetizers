//
//  RouteTabView.swift
//  Appetizers
//
//  Created by rojin on 12.04.2026.
//

import SwiftUI

struct RootTabView: View {
    @State private var router = AppRouter()

    var body: some View {
        TabView(selection: $router.selectedTab) {
            NavigationStack(path:   $router.categoryPath) {
                CategoryView()
                    .navigationDestination(for: CategoryRoute.self) { route in
                    switch route {
                    case .meals(let meal):
                        MealsView(mealString:meal)
                    case .mealDetail(let meal):
                        MealDetailView(meal: meal,isDetail: .constant(false))
                    }
                }
            }
            .tabItem { Label("Home", systemImage: "house") }
            .tag(Tab.category)

            NavigationStack(path:  $router.accountPath) {
                AccountView()
            }
            .tabItem { Label("Account", systemImage: "person") }
            .tag(Tab.account)

            NavigationStack(path: $router.orderPath) {
                CategoryListView()
                    .navigationDestination(for: OrderRoute.self) { route in
                        switch route {
                        case .products:
                            ProductListView()
                        case .detail:
                            ProductDetailView()
                        }
                    }
            }
            .tabItem { Label("Orders", systemImage: "bag") }
            .tag(Tab.order)
        } .environment(router)
    }
}
#Preview {
    RootTabView().environment(AppRouter())
}
