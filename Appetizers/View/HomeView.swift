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
            List(viewmodel.appetizers){ appetizer in
                AppetizerWidget(appetizer: appetizer)
            }.navigationTitle("Appetizers")
        }.onAppear(){
            viewmodel.getAppetizers()
        }
    }
}

#Preview {
    HomeView()
}
