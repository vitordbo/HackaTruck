//
//  Desafio1.swift
//  Desafios
//
//  Created by Vitor on 09/10/23.
//

import SwiftUI

struct Challenge1: View {
    var body: some View {
        VStack{
            Image("iamge1").resizable().frame(width: 350, height: 220)
            Text("HackaTruck").font(.title).foregroundColor(.blue).bold()
            HStack{
                Text("Maker").foregroundColor(.yellow).bold()
                Text("Space").foregroundColor(.red).bold()
            }
            
        }
    }
}

struct Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        Challenge1()
    }
}
