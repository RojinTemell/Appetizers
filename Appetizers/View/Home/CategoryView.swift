//
//  HomeCategoryView.swift
//  Appetizers
//
//  Created by rojin on 10.04.2026.
//

import SwiftUI

struct CategoryView: View {
    @Environment(AppRouter.self) private var router
    @StateObject var viewmodel = CategoryViewModel()
    var body: some View {
            ScrollView{
                LazyVGrid(columns:viewmodel.columns){
                    ForEach(viewmodel.categories){
                        category in
                            CategoryWidget(category: category)
                            .onTapGesture {
                                router.navigateInHome(to:.meals(meal: category.strCategory))
                            }
                    }
                }
            }
            .navigationTitle("Category")

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
    CategoryView().environment(AppRouter())
}
