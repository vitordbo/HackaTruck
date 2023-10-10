//
//  Desafio2.swift
//  Desafios
//
//  Created by Vitor on 09/10/23.
//

import SwiftUI

struct Challenge2: View {
    var body: some View {
        VStack{
            Image("iamge1").resizable().frame(width: 400, height: 250).frame(alignment: .topLeading).padding(10).padding(EdgeInsets(top: 55, leading: 10, bottom: 10, trailing: 10))
            
            ZStack{
                Image("iamge1").resizable().clipShape(Circle()).frame(width: 400, height: 300).padding()
                Text("HackaTruck").bold().foregroundColor(.blue).padding(EdgeInsets(top: 20, leading: 10, bottom: 160, trailing: 10)).font(.system(size: 40))
            }
            ZStack {
                       Rectangle()
                    .fill(Color.black).frame(width: 250, height: 200)
                       HStack {
                           Text("Maker").foregroundColor(.yellow).bold().font(.system(size: 25))
                          Text("Space")
                               .foregroundColor(.red).bold().font(.system(size: 25))
                       }
                   }.padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
        }
    }
}

struct Challenge2_Previews: PreviewProvider {
    static var previews: some View {
        Challenge2()
    }
}
