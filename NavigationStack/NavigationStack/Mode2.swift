//
//  Mode2.swift
//  NavigationStack
//
//  Created by Student on 11/10/23.
//

import SwiftUI

struct Mode2: View {
    var body: some View {
        VStack{
            Text("Estamos percorrendo um caminho Edilson")
            NavigationLink(destination: Mode4()) {
                Text("Acessar Tela")
            }
        }
    }
}

struct Mode2_Previews: PreviewProvider {
    static var previews: some View {
        Mode2()
    }
}
