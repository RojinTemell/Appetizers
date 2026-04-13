//
//  RouteEnum.swift
//  Appetizers
//
//  Created by rojin on 12.04.2026.
//

import Foundation

enum CategoryRoute : Hashable {
    case meals(meal:String)
    case mealDetail(meal:Meal)
}

enum AccountRoute :Hashable {

}
enum OrderRoute :Hashable {
    case products
    case detail
}
enum Tab: Hashable {
    case category, account, order
}
