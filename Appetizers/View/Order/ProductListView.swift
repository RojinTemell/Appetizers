//
//  ProductListView.swift
//  NavigationExample
//
//  Created by rojin on 13.04.2026.
//

import SwiftUI

struct ProductListView: View {
    @Environment(AppRouter.self) private var router


    // Normalde bu veri bir ViewModel/service'ten gelir
    let products = (1...6).map { i in
        (id: i, name: "Ürün \(i)", price: Double(i) * 49.90)
    }

    var body: some View {
        List(products, id: \.id) { product in
            Button {
                // Katman 3'e geç
                router.navigateInStore(to: .detail)
            } label: {
                HStack {
                    VStack(alignment: .leading) {
                        Text(product.name).font(.headline)
                        Text("tl₺")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.tertiary)
                }
            }
            .foregroundStyle(.primary)
        }
        .navigationTitle("Kategori  Ürünleri")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProductListView().environment(AppRouter())
}
