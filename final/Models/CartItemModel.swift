//
//  CartItemModel.swift
//  final
//
//  Created by N S on 03.07.2023.
//

import Foundation

final class CartItemModel: ObservableObject {
    @Published var items = [Item]()
    
    var totalPrice: Int {
        items.reduce(0) { $0 + $1.price }
  
    }

    func add(_ item: Item) {
        items.append(item)
    
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
