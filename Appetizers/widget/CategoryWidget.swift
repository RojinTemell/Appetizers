//
//  AppetizerWidget.swift
//  Appetizers
//
//  Created by rojin on 8.04.2026.
//

import SwiftUI

struct CategoryWidget: View {
    var category:Category
    var body: some View {
        VStack{
            ImageWidget(urlString: category.strCategoryThumb)
                .aspectRatio(contentMode: .fit)
                .padding()
                .frame(height: 120)

            Text(category.strCategory)
                .padding(.bottom)
                .font(.title2)
                .foregroundStyle(.black)

        }.background(Color.gray.opacity(0.1))
            .cornerRadius(12)
    }
}

#Preview {
    CategoryWidget(category: CategoryMockData.sampleCategory)
}
