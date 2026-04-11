//
//  HomeCategoryView.swift
//  Appetizers
//
//  Created by rojin on 10.04.2026.
//

import SwiftUI

struct CategoryView: View {
    @StateObject var viewmodel = CategoryViewModel()
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns:viewmodel.columns){
                    ForEach(viewmodel.categories){
                        category in
                        NavigationLink(value: category){
                            CategoryWidget(category: category)
                        }
                    }
                }
            }
            .navigationTitle("Category")
            .navigationDestination(for:Category.self){ category in MealsView( mealString: category.strCategory)

            }
        }
        .task{
            await viewmodel.getCategories()
        }.alert(item: $viewmodel.alertItem){ alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton
            )
        }
    }
}

#Preview {
    CategoryView()
}
