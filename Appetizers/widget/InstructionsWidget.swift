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
        NavigationStack{
            ScrollView{
                ForEach(instructionsLoader.instructions , id: \.self){step in
                    VStack(alignment: .leading) {
                        if step.lowercased().contains("step") {
                            Text(step.uppercased())
                                .font(.default)
                                .foregroundColor(.primaryButton)
                                .padding(.top, 6)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        } else {
                            Text(step)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }.padding(.leading)

                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            }.scrollDisabled(true)

            .task {
              await  instructionsLoader.separate(from:strInst )
            }
        }
    }
}

#Preview {
    InstructionsWidget(strInst: MealMockData.sampleMeal.strInstructions)
}
