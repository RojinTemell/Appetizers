//
//  InstructionsWidget.swift
//  Appetizers
//
//  Created by rojin on 11.04.2026.
//

import SwiftUI

struct InstructionsWidget: View {
    @StateObject var instructionsLoader = InstructionsLoader()
    var strInst:String
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 4) {
                ForEach(instructionsLoader.instructions, id: \.self) { step in
                    if step.lowercased().contains("step") {
                        Text(step.uppercased())
                            .font(.default)
                            .foregroundColor(.primaryButton)
                            .padding(.top, 6)
                    } else {
                        Text(step)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(2)
                    }
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .task {
            await instructionsLoader.separate(from: strInst)
        }
    }
}

#Preview {
    InstructionsWidget(strInst: MealMockData.sampleMeal.strInstructions)
}
