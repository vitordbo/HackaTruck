//
//  HomePage.swift
//  MelhorQuitanda
//
//  Created by Student on 24/10/23.
//

import SwiftUI
import CoreLocation

struct HomePage: View {
    @StateObject var vm = FruitViewModel()

    var body: some View {
        TabView{
            FruitsView().tabItem{
                        (Label("Fruits", systemImage: "cart.circle.fill"))
            }
            EnderecoView(selectedLocation: Endereco(nome: "melhor", coordinate: CLLocationCoordinate2D(latitude: 52.3555, longitude: 1.1743), description: "")).tabItem
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
