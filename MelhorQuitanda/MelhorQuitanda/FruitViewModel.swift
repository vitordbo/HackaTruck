//
//  FruitViewModel.swift
//  MelhorQuitanda
//
//  Created by Vitor on 24/10/23.
//

import Foundation

//struct API : Decodable{
//    var data: [Quitanda]
//}

struct Quitanda: Decodable, Identifiable {
    var id: String? // chamar o proximo
    var Nome: String?
    var Endereco: String?
    var Frutas: [Fruits]? // vai ser array?
}

struct Fruits: Decodable { // hasable?
    var Nome: String?
    var Quantidade: Int?
    var Foto: String?
    var Cor: String?
}

class FruitViewModel: ObservableObject {
    @Published var quitanda : [Quitanda] = []
    
    func fetchQuitanda() {
        //  declarar a url (endpoint)
        guard let url =  URL(string: "http://localhost:1880/getAllQuitandas") else {
            return
        }

        // criar tarefa => task => decodificar e salvar no array
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            // data => oq quer (conteudo) // response => metadados (ip, horario,...)
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let dadosDecodificados = try JSONDecoder().decode([Quitanda].self, from: data)
                
                DispatchQueue.main.async {
                    self?.quitanda = dadosDecodificados
                }
                
            }catch{
                print(error)
            }
        }
        
        // executar task
        task.resume()
    }
}
