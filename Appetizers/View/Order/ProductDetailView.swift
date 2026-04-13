//
//  ProductDetailView.swift
//  NavigationExample
//
//  Created by rojin on 13.04.2026.
//

import SwiftUI

struct ProductDetailView: View {
    @Environment(AppRouter.self) private var router


    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Ürün görseli placeholder
                RoundedRectangle(cornerRadius: 16)
                    .fill(.quaternary)
                    .frame(height: 220)
                    .overlay {
                        Image(systemName: "photo")
                            .font(.largeTitle)
                            .foregroundStyle(.tertiary)
                    }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Ürün")
                        .font(.title2.bold())
                    Text(" ₺")
                        .font(.title3)
                        .foregroundStyle(.orange)
                    Text("Bu ürünün detay açıklaması burada yer alır. " +
                         "NavigationPath sayesinde buraya hem liste üzerinden " +
                         "hem de deep link ile programatik olarak ulaşılabilir.")
                    .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                // Programatik navigasyon örneği: başka bir ürüne geç
                Button("Ürün 3'e Git (Deep Link)") {
                    router.goToProductDetail()
                }
                .buttonStyle(.bordered)

//                Button("Listeye Dön") {
//                    router.popInStore()       // sadece bir adım geri
//                }
//                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
        .navigationTitle("Ürün Detayı")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProductDetailView().environment(AppRouter())
}
