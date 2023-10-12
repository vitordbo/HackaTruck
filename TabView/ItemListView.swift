//
//  ItemListView.swift
//  TabView-NavigationStack
//
//  Created by Vitor on 11/10/23.
//

import SwiftUI

struct ItemListView: View {
    var body: some View {
        List {
            ForEach((1...100), id: \.self) {
                    Text("Item \($0)")
                }
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView()
    }
}
