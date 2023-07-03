//
//  DishesViewModel.swift
//  final
//
//  Created by N S on 03.07.2023.
//

import Foundation

class DishesViewModel: ObservableObject {
    
    @Published var dishes = [Item]()
    @Published var selectedDish: Item?
    @Published var isShowingDetailView = false
    @Published var tegs = [String]()
    
    init() {
        var urlArray = [String]()
        guard let url = URL(string: "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b") else { return }
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                do {
                    let menu = try JSONDecoder().decode(DetailedMenu.self, from: data)
                    DispatchQueue.main.async {
                        self.dishes = menu.dishes
                        
                        for dish in menu.dishes {
                            urlArray.append(contentsOf: dish.tegs.map({ String($0) }))
                            self.tegs = Array(Set(urlArray)).sorted(by: <)
                        }
                    }
                } catch {
                    print("failed to decode \(error.localizedDescription)")
                }
            }.resume()
        }
    }

