//
//  ContentView.swift
//  ConsumingApi2
//
//  Created by Student on 20/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = CoinViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    ForEach(vm.coins){ c in
                        NavigationLink(destination: CoinDetail(id: c.id!)){
                            HStack{
                                Text(c.id!)
                                Text(c.symbol!)
                                Spacer()
                                Text(c.rank!)
                            }.padding(10).background(.blue).foregroundColor(.white)
                        }
                    }
                }.onAppear(){
                    vm.fetchCoin()
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
