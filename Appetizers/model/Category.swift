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

struct Category: Codable, Identifiable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
    var id: String {
        return idCategory
    }
}
