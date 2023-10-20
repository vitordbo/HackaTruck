//
//  ApiCall.swift
//  ConsumingApi
//
//  Created by Student on 19/10/23.
//

import Foundation

struct PokemonListResponse: Decodable {
    let results: [Pokemon]
}

class ApiCall: ObservableObject {
    @Published var chars: [Pokemon] = []
    
    static let shared = ApiCall()
    
    private let baseUrl = "https://pokeapi.co/api/v2/pokemon/"
    
    func fetchPokemonList(completion: @escaping ([Pokemon]?) -> Void) {
        if let url = URL(string: baseUrl) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(PokemonListResponse.self, from: data)
                        completion(result.results)
                    } catch {
                        print("Error decoding data: \(error)")
                        completion(nil)
                    }
                } else if let error = error {
                    print("Error fetching data: \(error)")
                    completion(nil)
                }
            }.resume()
        }
    }
    
    func fetchPokemonDetails(for pokemon: Pokemon, completion: @escaping (Pokemon?) -> Void) {
            if let url = URL(string: baseUrl + pokemon.name) {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            let details = try decoder.decode(PokemonDetails.self, from: data)
                            var updatedPokemon = pokemon
                            updatedPokemon.imageURL = details.sprites.front_default
                            completion(updatedPokemon)
                        } catch {
                            print("Error decoding data: \(error)")
                            completion(nil)
                        }
                    } else if let error = error {
                        print("Error fetching data: \(error)")
                        completion(nil)
                    }
                }.resume()
            }
        }
    
}
