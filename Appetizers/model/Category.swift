//
//  Category.swift
//  Appetizers
//
//  Created by rojin on 10.04.2026.
//

import Foundation

struct CategoryResponse: Codable {
    let categories: [Category]
}

struct Category: Codable, Identifiable ,Hashable{
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
    var id: String {
        return idCategory
    }
}

struct CategoryMockData {
    static let sampleCategory = Category(idCategory: "1",
                                         strCategory: "Beef",
                                         strCategoryThumb: "https://www.themealdb.com/images/category/beef.png",
                                         strCategoryDescription: "Beef is the culinary name for meat from cattle, particularly skeletal muscle.")
    static let categories       = [sampleCategory, sampleCategory, sampleCategory, sampleCategory]
}
