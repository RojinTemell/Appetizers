//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by rojin on 8.04.2026.
//

import SwiftUI

@main
struct AppetizersApp: App {
//StateObject ile tek bir instance oluşur
   @StateObject private var orderViewModel = OrderViewModel()
    var body: some Scene {
        WindowGroup {
            RootTabView().environmentObject(orderViewModel)

        }
    }
}
