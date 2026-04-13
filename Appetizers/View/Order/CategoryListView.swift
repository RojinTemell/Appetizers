//
//  CategoryListView.swift
//  NavigationExample
//
//  Created by rojin on 13.04.2026.
//

import SwiftUI

struct CategoryListView: View {
    @Environment(AppRouter.self) private var router

    let categories = [
        (id: 1, name: "Elektronik", icon: "cpu"),
        (id: 2, name: "Kitaplar",   icon: "books.vertical"),
        (id: 3, name: "Spor",       icon: "figure.run"),
    ]

    var body: some View {
        List(categories, id: \.id) { category in
            Button {
                // path.append() → Katman 2'ye geç
                router.navigateInStore(to: .products)
            } label: {
                Label(category.name, systemImage: category.icon)
            }
        }
        .navigationTitle("Kategoriler")
        // Tab'a çift dokunulduğunda köke dön (iOS alışkanlığı)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Kökü Sıfırla") { router.popToOrderRoute() }
            }
        }
    }
}

#Preview {
    CategoryListView().environment(AppRouter())
}
