//
//  DisplayPokemonTableViewController.swift
//  pokedex_arcsa
//
//  Created by Cesar on 06/02/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import UIKit

//Variable que usaremos para la vista modal
var myindex: Int = 0

class DisplayPokemonTableViewController: UITableViewController {
    
    let pokemonController = PokeApiController()
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
 //Refrescamos la tabla para ver los favoritos cada vez que se añaden
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
           tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return pokemonController.favoritePokemon.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokeCell", for: indexPath)
        
        let pokemon = pokemonController.favoritePokemon[indexPath.row]
        guard let pokemonImageData = try? Data(contentsOf: pokemon.sprites.frontDefault )else{
                   fatalError()
               }
        //Pasamos el nombre y la imagen a la celda
        cell.imageView?.image = UIImage(data: pokemonImageData)
        cell.textLabel?.text = pokemon.name.capitalized
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myindex = indexPath.row
        performSegue(withIdentifier: "favPokemonSegue", sender: self)
    }

    
    // MARK: - Navigation

   //Vamos a pasar los datos del pokemon por el segue de un VC a otro
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchPokemon" {
            guard let searchVC = segue.destination as? BusquedaPokemonViewController else{ return }
            searchVC.pokemonController = pokemonController
        }
        
        //Para mandar al details view
        if segue.identifier == "favPokemonSegue" {
            guard let detailVC = segue.destination as? DetailViewController else{ return }
            detailVC.pokemonController = pokemonController
        }
        
    }
    

}
