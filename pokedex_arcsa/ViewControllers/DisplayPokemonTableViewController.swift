//
//  DisplayPokemonTableViewController.swift
//  pokedex_arcsa
//
//  Created by Cesar on 06/02/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import UIKit

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
        cell.textLabel?.text = pokemon.name.capitalized
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

   //Vamos a pasar los datos del pokemon por el segue de un VC a otro
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchPokemon" {
            guard let searchVC = segue.destination as? BusquedaPokemonViewController else{ return }
            searchVC.pokemonController = pokemonController
        }
    }
    

}
