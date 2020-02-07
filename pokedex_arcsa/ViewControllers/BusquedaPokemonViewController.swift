//
//  BusquedaPokemonViewController.swift
//  pokedex_arcsa
//
//  Created by Cesar on 06/02/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import UIKit

class BusquedaPokemonViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var imageView: UIImageView!
    
    
    let pokemonController = PokeApiController()
    var pokemon: Pokemon? {
        didSet{
            updateView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
    }
    
    //Obtendremos el texto de la barra de busqueda
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        guard let pokemonNameSB = searchBar.text else { return  }
        
    //Pasamos los datos del SearchBar a la funcion para hacer la peticion
    pokemonController.getPokemonData(pokemonName: pokemonNameSB) { (obtainedPokemon) in
        guard let obtainedPokemon = try? obtainedPokemon.get() else{ return}
        //Proceso de hilo principal
        DispatchQueue.main.async {
            self.pokemon = obtainedPokemon
        }
        }
        
        
    }
    
    func updateView(){
    //Verificamos si la vista ha sido cargada
        guard isViewLoaded else { return}
    //Actualizamos el titulo de la vista
        guard let pokemon = pokemon else { return  }
        title = pokemon.name.uppercased() + " ID : " + "\(pokemon.id)"
        
    //Guardamos el data de la url de la imagen en una variable
        guard let pokemonImageData = try? Data(contentsOf: pokemon.sprites.frontDefault )else{
            return
        }
    //Añadimos la imagen a la vista
        //Lo hacemos directo del Data para evitar posibles problemas de rendimiento
        imageView.image = UIImage(data: pokemonImageData)
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
