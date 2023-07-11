//
//  CategoryViewModel.swift
//  final
//
//  Created by N S on 03.07.2023.
//

import Foundation

final class CategoryMainViewModel: ObservableObject {
    
    //to broadcast to change
    @Published var categories: [Category] = []
    @Published var isLoading = false
    
    func getCategoriesView() {
        isLoading = true
        CategoryNetworkManager.shared.getCategories { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let categories):
                    self.categories = categories
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
