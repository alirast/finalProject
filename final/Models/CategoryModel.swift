//
//  CategoryModel.swift
//  final
//
//  Created by N S on 03.07.2023.
//

import Foundation

struct MockCategory: Decodable {
    static let sampleCategory = Category(id: 1, name: "Mor", image_url: "person")
}


struct MainScreen: Decodable {
    let сategories: [Category]
}

struct Category: Decodable, Hashable {
    let id: Int
    let name: String
    let image_url: String
}
