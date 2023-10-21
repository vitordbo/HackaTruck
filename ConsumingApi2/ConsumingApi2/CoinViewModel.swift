//
//  CoinViewModel.swift
//  ConsumingApi2
//
//  Created by Student on 20/10/23.
//

import Foundation

struct API : Decodable{
    var data: [Coin]
    //api.coincap.io/v2/assets
}

struct APIDetails : Decodable{
    var data: [CoinDetails]
    //api.coincap.io/v2/assets
}

struct Coin: Decodable, Identifiable {
    var id: String? // chamar o proximo
    var rank: String?
    var symbol: String?
}

struct CoinDetails: Decodable, Identifiable {
    var id: String? // chamar o proximo
    var baseId: String?
    var quoteId: String?
    var baseSymbol: String?
    var quoteSymbol: String?
    var volumeUsd24Hr: String?
    var priceUsd: String?
    var volumePercent: String?
}


class CoinViewModel: ObservableObject {
    @Published var coins : [Coin] = []
    @Published var coinsDetails : [CoinDetails] = []

    
    func fetchCoin() {
        //  declarar a url (endpoint)
        guard let url =  URL(string: "https://api.coincap.io/v2/assets") else {
            return
        }

        // criar tarefa => task => decodificar e salvar no array
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            // data => oq quer (conteudo) // response => metadados (ip, horario,...)
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let dadosDecodificados = try JSONDecoder().decode(API.self, from: data)
                
                DispatchQueue.main.async {
                    self?.coins = dadosDecodificados.data
                }
                
            }catch{
                print(error)
            }
        }
        
        // executar task
        task.resume()
    }
    
    func fetchCoinById(id: String) {
        //  declarar a url (endpoint)
        guard let url =  URL(string: "https://api.coincap.io/v2/assets/\(id)/markets") else {
            return
        }
        
        // criar tarefa => task => decodificar e salvar no array
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            // data => oq quer (conteudo) // response => metadados (ip, horario,...)
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let dadosDecodificados = try JSONDecoder().decode(APIDetails.self, from: data)
                
                DispatchQueue.main.async {
                    self?.coinsDetails = dadosDecodificados.data
                }
                
            }catch{
                print(error)
            }
        }
        
        // executar task
        task.resume()
        
    }
}
