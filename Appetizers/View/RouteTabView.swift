//
//  RouteTabView.swift
//  Appetizers
//
//  Created by rojin on 12.04.2026.
//

import SwiftUI

struct RootTabView: View {
    @Environment(AppRouter.self) private var router

    var body: some View {
        TabView(selection: Bindable(router).selectedTab) {
            NavigationStack(path: Bindable(router).categoryPath) {
                CategoryView()
                    .navigationDestination(for: CategoryRoute.self) { route in
                    switch route {
                    case .meals:
                        AppetizersListView( )
                    }
                }
            }
            .tabItem { Label("Home", systemImage: "house") }
            .tag(Tab.category)

            NavigationStack(path: Bindable(router).accountPath) {
                AccountView()
            }
            .tabItem { Label("Account", systemImage: "person") }
            .tag(Tab.account)

            NavigationStack(path: Bindable(router).orderPath) {
                OrdersView()
            }
            .tabItem { Label("Orders", systemImage: "bag") }
            .tag(Tab.order)
        }
    }
}
#Preview {
    RootTabView().environment(AppRouter())
}
