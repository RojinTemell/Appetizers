//
//  ContentView.swift
//  Appetizers
//
//  Created by rojin on 8.04.2026.
//

import SwiftUI

struct AppetizersTabView: View {
    var body: some View {
        TabView{
            HomeView().tabItem{
                Label("Home", systemImage: "house.fill")
            }
            OrdersView().tabItem{
                Label("Order", systemImage: "list.bullet.rectangle")
            }
            AccountView().tabItem{
                Label("Account", systemImage: "person")
            }
        }
    }
}

#Preview {
    AppetizersTabView()
}
