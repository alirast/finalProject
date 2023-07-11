//
//  SearchView.swift
//  final
//
//  Created by N S on 03.07.2023.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationView {
            Text("Search View")
            
                .toolbar {
                    ToolContent()
                }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
