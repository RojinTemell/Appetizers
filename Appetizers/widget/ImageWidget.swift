//
//  ImageWidget.swift
//  Appetizers
//
//  Created by rojin on 11.04.2026.
//

import SwiftUI

struct ImageWidget: View {
    @State private var imageLoader = ImageLoader()
    let urlString: String

    var body: some View {
        Group {
            if let uiImage = imageLoader.image {
                Image(uiImage: uiImage)
                    .resizable()
            } else {
                Image("food-placeholder")
                    .resizable()
            }
        }
        .task {
            await imageLoader.load(from: urlString)
        }
    }
}

#Preview {
    ImageWidget(urlString: "food-placeholder")
}
