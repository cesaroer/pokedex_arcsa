//
//  DetailViewController.swift
//  pokedex_arcsa
//
//  Created by Cesar on 07/02/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var pokeID: UILabel!
    @IBOutlet weak var pokeImage: UIImageView!
    
    var pokemonController: PokeApiController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //Asignando propiedades a la modalView
        let pokemon = pokemonController?.favoritePokemon[myindex]
        pokeName.text = pokemonController?.favoritePokemon[myindex].name
        guard let pokemonImageData = try? Data(contentsOf: (pokemon?.sprites.frontDefault ?? nil)! )else{ fatalError() }
    //Imagen
        pokeImage.image = UIImage(data: pokemonImageData)
    //Forzando unwrapping del id
        let id = pokemon?.id
        pokeID.text = "id: \(id!)"
    
        
    }
    

 

}
