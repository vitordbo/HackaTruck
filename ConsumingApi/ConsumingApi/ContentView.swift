//
//  ContentView.swift
//  ConsumingApi
//
//  Created by Student on 19/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var pokemonList: [Pokemon] = []
    @State private var selectedPokemon: Pokemon? = nil

    var body: some View {
        NavigationView {
                    List(pokemonList, id: \.name) { pokemon in
                        Button(action: {
                            self.fetchPokemonDetails(for: pokemon)
                        }) {
                            Text(pokemon.name)
                        }
                    }
                    .sheet(item: $selectedPokemon) { pokemon in
                        if let imageURL = pokemon.imageURL {
                            AsyncImage(url: imageURL)
                                .padding()
                                .navigationBarTitle(pokemon.name)
                        }
                    }
                    .onAppear {
                        ApiCall.shared.fetchPokemonList { result in
                            if let result = result {
                                self.pokemonList = result
                            }
                        }
                    }
                }
            }

            func fetchPokemonDetails(for pokemon: Pokemon) {
                print("Fetching details for \(pokemon.name)")
                ApiCall.shared.fetchPokemonDetails(for: pokemon) { result in
                    if let result = result {
                        self.selectedPokemon = result
                    }
                }
            }
        }
       
