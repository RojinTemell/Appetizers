//
//  MealWidget.swift
//  Appetizers
//
//  Created by rojin on 11.04.2026.
//

import SwiftUI

struct MealWidget: View {
    let meal:Meal
    var body: some View {
        HStack{
            ImageWidget(urlString: meal.strMealThumb)
                .cornerRadius(8)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120,height: 100)

            VStack(alignment: .leading,spacing: 5){
                Text(meal.strMeal)
                    .font(.title)
                    .fontWeight(.medium)
                Text(meal.strInstructions)
                    .lineLimit(2)
                    .font(.title3)
                    .fontWeight(.light)
                Text(meal.strArea)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
            }
        }.padding(.leading)
    }
}

#Preview {
    MealWidget(meal: MealMockData.sampleMeal)
}
