//
//  CategoryModel.swift
//  final
//
//  Created by N S on 03.07.2023.
//

import Foundation

struct MainScreen: Decodable {
    let сategories: [Category]
}

struct Category: Decodable, Hashable {
    let id: Int
    let name: String
    let image_url: String
}
