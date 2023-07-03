//
//  finalApp.swift
//  final
//
//  Created by N S on 03.07.2023.
//

import SwiftUI

@main
struct finalApp: App {
    var cartItem = CartItemModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(cartItem)
        }
    }
}
