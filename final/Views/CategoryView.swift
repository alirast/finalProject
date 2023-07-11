//
//  CategoryView.swift
//  final
//
//  Created by N S on 03.07.2023.
//

import SwiftUI

struct CategoryView: View {
    @ObservedObject var viewModel = CategoryMainViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.categories, id: \.self) { category in
                    NavigationLink(destination: DishesView(category: category)) {
                        ZStack(alignment: .topLeading) {
                            AsyncImage(url: URL(string: category.image_url)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 343, maxHeight: 148, alignment: .center)
                            } placeholder: {
                                Image(systemName: "photo.on.rectangle.angled")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 343, height: 148)
                            }
                            Text(category.name)
                                .foregroundColor(.black)
                                .padding(.leading, 16)
                                .padding(.top, 12)
                                .lineLimit(2)
                                .font(.custom("SFProDisplay", size: 20).bold())
                        }
                        
                    }
                    
                }
                
            }
            .toolbar { ToolContent() }
        }
        

    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}

