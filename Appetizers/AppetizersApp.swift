//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by rojin on 8.04.2026.
//

import SwiftUI

@main
struct AppetizersApp: App {
    @State private var router = AppRouter()
    var body: some Scene {
        WindowGroup {
            RootTabView()
                .environment(router)
        }
    }
}
