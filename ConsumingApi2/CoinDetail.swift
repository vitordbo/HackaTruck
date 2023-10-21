//
//  CoinDetail.swift
//  ConsumingApi2
//
//  Created by Student on 20/10/23.
//

import SwiftUI

struct CoinDetail: View {
    var id: String
    
    @StateObject var vm = CoinViewModel()
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(vm.coinsDetails){ c in
                        VStack{
                            Text(c.baseId!)
                            Text(c.quoteId!)
                            Text(c.baseSymbol!)
                            Text(c.quoteSymbol!)

                            Spacer()
                        }.padding(10).background(.blue).foregroundColor(.white)
                    
                }
            }.onAppear(){
                vm.fetchCoinById(id: id)
            }
        }
    }
}


struct CoinDetail_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetail(id: "Edilson")
    }
}
