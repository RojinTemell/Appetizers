//
//  HomeCategoryView.swift
//  Appetizers
//
//  Created by rojin on 10.04.2026.
//

import SwiftUI

struct HomeCategoryView: View {
    @StateObject var viewmodel = AppetizersViewmodel()
    var body: some View {
        NavigationView{
            List(viewmodel.categories){ category in
                VStack{
                    Text(category.strCategory)
                }
            }.navigationTitle("Category")
        }.task{
            await viewmodel.getCategories()
        }
    }
}

#Preview {
    HomeCategoryView()
}
