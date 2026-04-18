//
//  MealDetailView.swift
//  Appetizers
//
//  Created by rojin on 11.04.2026.
//

import SwiftUI

struct MealDetailView: View {

    var meal:Meal
    @Binding var isDetail:Bool
    @EnvironmentObject var orderViewModel: OrderViewModel
    @Environment(\.openURL) private var openURL
    var body: some View {
        VStack{
            ImageWidget(urlString: meal.strMealThumb)
            Text(meal.strMeal) .font(.title)
                .fontWeight(.medium)

          InstructionsWidget(strInst: meal.strInstructions)
               .frame(maxHeight:300)

            HStack{
                Button{
                    orderViewModel.add(meal)
                    isDetail = false
                }label :{
                    Text("Add to Order")
                }
                .modifier(StandarButtonStyle())

                Button{
                    openURL(URL(string:meal.strYoutube)!)
                }label :{
                    Text("YouTube'da İzle")
                }
                .modifier(StandarButtonStyle())

            }   .padding(.bottom,20)



        }.frame(width: 320,height: 600)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 48)
            .overlay(alignment: .topTrailing) {
                Button {
                    isDetail = false
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .opacity(0.6)
                        Image(systemName: "xmark")
                            .imageScale(.medium)
                            .foregroundColor(.black)
                    }.padding(6)
                }
            }

    }
}

#Preview {
    MealDetailView(meal: MealMockData.sampleMeal, isDetail: .constant(false))
}
