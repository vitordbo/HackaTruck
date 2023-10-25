//
//  StartView.swift
//  MelhorQuitanda
//
//  Created by Student on 24/10/23.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        ZStack{
            NavigationView{
                VStack{
                    Text("Bem-vindo(a)!").foregroundColor(.green).font(.title).fontWeight(.bold) .padding(10)
                    Image("logo").resizable().scaledToFit()
                    NavigationLink(destination: HomePage()){
                        HStack{
                            Image(systemName: "cart.fill")
                            Text("Entrar")
                        }.tint(.green)
                         .font(.title2)
                         .fontWeight(.bold)
                    }
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
