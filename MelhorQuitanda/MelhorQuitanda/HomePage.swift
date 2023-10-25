//
//  HomePage.swift
//  MelhorQuitanda
//
//  Created by Student on 24/10/23.
//

import SwiftUI

struct HomePage: View {
    @StateObject var vm = FruitViewModel()

    var body: some View {
        TabView{
            EnderecoView().badge(2).tabItem
            {
                (Label("Home", systemImage: "house.fill"))
            }
            EnderecoView().tabItem{
                        (Label("Fruits", systemImage: "photo"))
            }
            EnderecoView().tabItem
            {
                (Label("Endereco", systemImage: "globe"))
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
