//
//  ContentView.swift
//  final
//
//  Created by N S on 03.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //NavigationView {
            TabView {
                CategoryView().tabItem() {
                    Image("category").renderingMode(.template)
                    Text("Главная")
                }
                SearchView().tabItem {
                    Image("search").renderingMode(.template)
                    Text("Поиск")
                }
                CartView().tabItem {
                    Image("cart").renderingMode(.template)
                    Text("Корзина")
                }
                AccountView().tabItem {
                    Image("account").renderingMode(.template)
                    Text("Аккаунт")
                }
            }
            .tabViewStyle(DefaultTabViewStyle())
            .accentColor(Color(uiColor: UIColor(red: CGFloat(51.0/255), green: CGFloat(100.0/255), blue: CGFloat(224.0/255), alpha: 1.0)))
        //}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
