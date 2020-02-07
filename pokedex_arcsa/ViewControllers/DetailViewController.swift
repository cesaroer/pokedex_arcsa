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
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var atackLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    
    
    
    
    var pokemonController: PokeApiController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //Asignando propiedades a la modalView
        let pokemon = pokemonController?.favoritePokemon[myindex]
        pokeName.text = pokemonController?.favoritePokemon[myindex].name.capitalized
        guard let pokemonImageData = try? Data(contentsOf: (pokemon?.sprites.frontDefault ?? nil)! )else{ fatalError() }
    //Imagen
        pokeImage.image = UIImage(data: pokemonImageData)
    //Forzando unwrapping del id
        let id = pokemon?.id
        pokeID.text = "Id: \(id!)"
    //Añadiendo Stats a labels
        weightLabel.text = "Weight: \(pokemon!.weight)"
        heightLabel.text =  "Height: \(pokemon!.height)"
        defenseLabel.text = "Defense: \(pokemon!.stats[1].baseStat)"
        hpLabel.text = "Hp: \(pokemon!.stats[5].baseStat)"
        atackLabel.text = "Atack: \(pokemon!.stats[4].baseStat)"

    
        
    }
    

 

}
