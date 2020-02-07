//
//  Pokemon.swift
//  pokedex_arcsa
//
//  Created by Cesar on 06/02/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    let name: String
    let id: Int
    let sprites: Sprite
    
}

struct Sprite: Codable {
//En el json se llama front_default pero lo convertiremos a SnakeCase en el Json Decoder
    let frontDefault: URL
}
