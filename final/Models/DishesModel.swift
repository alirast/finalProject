//
//  DishesModel.swift
//  final
//
//  Created by N S on 03.07.2023.
//

import Foundation

struct MockItem: Decodable {
    static let sampleItem = Item(id: 1, name: "rice", price: 799, weight: 560, description: "In china we have a lot of rice", image_url: "person", tegs: ["all menu"])
}

struct DetailedMenu: Decodable {
    let dishes: [Item]
}


struct Item: Decodable, Hashable {
    let id: Int
    let name: String
    let price: Int
    let weight: Int
    let description: String
    let image_url: String
    let tegs: [String]
}
