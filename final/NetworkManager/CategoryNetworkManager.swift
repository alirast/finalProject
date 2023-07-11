//
//  CategoryNetworkManager.swift
//  final
//
//  Created by N S on 11.07.2023.
//

import UIKit

final class CategoryNetworkManager {
    static let shared = CategoryNetworkManager()
    
    static let baseURL = "https://run.mocky.io/v3/"
    private let categoryURL = baseURL + "058729bd-1402-4578-88de-265481fd7d54"
    
    private init() {}
    
    func getCategories(completion: @escaping (Result<[Category], CategoryError>) -> Void) {
        guard let url = URL(string: categoryURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToCompleteTask))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(MainScreen.self, from: data)
                completion(.success(decodedResponse.сategories))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
}
