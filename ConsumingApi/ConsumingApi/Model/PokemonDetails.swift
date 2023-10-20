//
//  PokemonDetails.swift
//  ConsumingApi
//
//  Created by Student on 19/10/23.
//

import Foundation

struct PokemonDetails: Decodable {
    let name: String
    let sprites: Sprites
    
    struct Sprites: Decodable {
        let front_default: URL?
    }
}
