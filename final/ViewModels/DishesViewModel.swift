//
//  DishesViewModel.swift
//  final
//
//  Created by N S on 03.07.2023.
//

import Foundation

class DishesViewModel: ObservableObject {
    @Published var dishes = [Item]()
    @Published var tegs = [String]()
    @Published var selectedDish: Item?
    @Published var isShowingDetailView = false
    private let networkManager = DishesNetworkManager()
    
    init() {
        fetchDishes()
    }
    
    func fetchDishes() {
        Task {
            do {
                let menu = try await networkManager.fetchData()
                DispatchQueue.main.async {
                    self.dishes = menu.dishes
                    
                    var urlArray = [String]()
                    for dish in menu.dishes {
                        urlArray.append(contentsOf: dish.tegs.map( { String($0) }))
                        self.tegs = Array(Set(urlArray)).sorted(by: <)
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
