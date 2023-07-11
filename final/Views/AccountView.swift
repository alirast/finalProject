//
//  AccountView.swift
//  final
//
//  Created by N S on 03.07.2023.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            Text("Account View")
            
                .toolbar {
                    ToolContent()
                }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
