//
//  DishesNetworkManager.swift
//  final
//
//  Created by N S on 12.07.2023.
//

import Foundation

class DishesNetworkManager {
    static let baseURL = "https://run.mocky.io/v3/"
    private let dishesURL = baseURL + "aba7ecaa-0a70-453b-b62d-0e326c859b3b"
    
    func fetchData() async throws -> DetailedMenu {
        guard let url = URL(string: dishesURL) else { throw DishesError.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let menu = try JSONDecoder().decode(DetailedMenu.self, from: data)
            return menu
        } catch {
            throw error
        }
    }
}
