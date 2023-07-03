//
//  CategoryViewModel.swift
//  final
//
//  Created by N S on 03.07.2023.
//

import Foundation

class CategoryMainViewModel: ObservableObject {
    @Published var categories = [Category]()

    init() {
        guard let url = URL(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let mainMenu = try JSONDecoder().decode(MainScreen.self, from: data)
                DispatchQueue.main.async {
                    self.categories = mainMenu.сategories
                }
            } catch {
                print("category failed to decode \(error.localizedDescription)")
            }
        }.resume()
    }
}
