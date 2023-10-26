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
                            Text(fruit.Nome!).foregroundColor(.black).onTapGesture {
                                showSheet.toggle()
                            }
                        }
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
