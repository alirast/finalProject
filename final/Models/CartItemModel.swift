//
//  CartItemModel.swift
//  final
//
//  Created by N S on 03.07.2023.
//

import Foundation

final class CartItemModel: ObservableObject {
    @Published var items = [Item]()
    @Published var quantities = [Item : Int]()
    
    var totalPrice: Int {
        items.reduce(0) { $0 + $1.price }
  
    }

    func add(_ item: Item) {
        items.append(item)
    
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func quantity(for item: Item) -> Int {
        return quantities[item] ?? 0
    }
    
    func updateQuantity(for item: Item, quantity: Int) {
        quantities[item] = quantity
    }
}
