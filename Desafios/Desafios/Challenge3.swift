//
//  Challenge3.swift
//  Desafios
//
//  Created by Vitor on 09/10/23.
//

import SwiftUI

struct Challenge3: View {
    @State private var name: String = "Vitor"
    @State private var showingAlert = false

    var body: some View {
        VStack{
            Text("Bem-vindo, " + name).font(.system(size: 30)).frame(alignment: .center)
                TextField(
                  "Digite seu nome",
                  text: $name
                ).frame(alignment: .center).multilineTextAlignment(.center).frame(alignment: .top)
            Spacer()
            ZStack{
                Image("iamge1").resizable().scaleEffect(1.0).opacity(0.2).padding(EdgeInsets(top: 10, leading: 10, bottom: -60, trailing: 10))
                Image("logo").resizable().scaleEffect(0.3).frame(width: 600)
                Image("truck").resizable().frame(width: 600, height: 200).scaleEffect(0.5).padding(EdgeInsets(top: 320, leading: 10, bottom: 10, trailing: 10))
            }
            Button("Enviar") {
                        showingAlert = true
                    }
                    .alert(isPresented:$showingAlert) {
                        Alert(
                            title: Text("Parabéns, voce completou o desafio de hoje"),
                            primaryButton:.default (Text("OK")) {
                                print("Deleting...")
                            },
                            secondaryButton: .cancel()
                        )
                    }
        }
    }
}

struct Challenge3_Previews: PreviewProvider {
    static var previews: some View {
        Challenge3()
    }
}
