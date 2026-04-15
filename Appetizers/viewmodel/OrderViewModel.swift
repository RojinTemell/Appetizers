//
//  OrderViewModel.swift
//  Appetizers
//
//  Created by rojin on 15.04.2026.
//

import SwiftUI
import Combine


final class OrderViewModel :ObservableObject {

    @Published var orders :[Meal] = []

    func add (_ meal :Meal){
        print("ekleniyor")
        orders.append(meal)
        print("eklendi \(orders.count)")

    }
    
    func delete (at offsets:IndexSet){
        orders.remove(atOffsets: offsets)
    }

}
