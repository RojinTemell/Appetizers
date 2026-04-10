//
//  HomeView.swift
//  Appetizers
//
//  Created by rojin on 8.04.2026.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewmodel = AppetizersViewmodel()

    var body: some View {
        NavigationView{
            List(viewmodel.meals){ meal in
                HStack{
                    Image(meal.strMealThumb)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120,height: 100)
                        .cornerRadius(8)
                    VStack(alignment: .leading,spacing: 5){
                        Text(meal.strMeal).font(.title2).fontWeight(.medium)

//                        Text(meal.strInstructions).fontWeight(.semibold).foregroundColor(.secondary)
                    }
                }.padding(.leading)
            }.navigationTitle("Meals")
        }.task{
         await  viewmodel.getMeals(meal: "Beef")
        }
    }
}

#Preview {
    HomeView()
}
