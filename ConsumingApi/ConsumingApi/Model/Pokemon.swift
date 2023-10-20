//
//  Wizards.swift
//  ConsumingApi
//
//  Created by Student on 19/10/23.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int?
    let name: String
    let height: Double?
    let weight: Double?
    let url: URL?
    var imageURL: URL? // Propriedade para armazenar a URL da imagem
}
