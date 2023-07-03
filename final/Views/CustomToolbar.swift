//
//  CustomToolbar.swift
//  final
//
//  Created by N S on 03.07.2023.
//

import SwiftUI

struct ToolContent: ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .navigationBarLeading) {
            Image("locationPin").resizable().font(Font.system(.largeTitle).bold()).frame(width: 24, height: 24)
            
            VStack(alignment: .leading) {
                Text("Санкт-Петербург").font(.custom("SFProDisplay", size: 18).bold())
                Text(getCurrentDate()).font(.custom("SFProDisplay", size: 14)).foregroundColor(.gray)
            }
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
            Image("profilePicture").resizable().frame(width: 44, height: 44).clipShape(Circle()).padding(.trailing)

        }
    }
    private func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM, yyyy"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: Date())
    }
}
