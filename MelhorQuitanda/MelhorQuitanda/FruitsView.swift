//
//  FruitsView.swift
//  MelhorQuitanda
//
//  Created by Student on 25/10/23.
//

import SwiftUI

struct FruitsView: View {
    @StateObject var vm = FruitViewModel()
    @State var showSheet = false
    
    var body: some View {
        NavigationStack{
            VStack{
                ForEach(vm.quitanda, id: \._id) { f in
                        List(f.Frutas!, id: \.self) { fruit in
                            Text(fruit.Nome!).foregroundColor(.black).onTapGesture
                            {
                                showSheet.toggle()
                            }.font(.title).fontWeight(.bold)
                            AsyncImage(url: URL(string: fruit.Foto!)).imageScale(.small).scaledToFit().scaleEffect(0.4).frame(height: 250)
                            Text("Cor: " + fruit.Cor!).font(.title3)
                            if(fruit.Quantidade! < 5){
                                Text("Quantidade: " + String(fruit.Quantidade!)).font(.title3).foregroundColor(.red)
                            }else {
                                Text("Quantidade: " + String(fruit.Quantidade!)).font(.title3).foregroundColor(.green)
                            }
                        }.navigationTitle("Frutas da quitanda").listStyle(.insetGrouped)
                        }.sheet(isPresented: $showSheet){
                            FruitsDetails()
                }
            }.onAppear(){
                vm.fetchQuitanda()
            }
        }
        
    }
}

struct FruitsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitsView()
    }
}
