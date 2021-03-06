//
//  PokeApiController.swift
//  pokedex_arcsa
//
//  Created by Cesar on 06/02/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import Foundation

class PokeApiController{
    
    var favoritePokemon: [Pokemon] = []
    
    //declaramos la URL base para buscar los pokemon por nombre
    let baseUrl = URL(string: "https://pokeapi.co/api/v2/pokemon/")!
    
// MARK: FUNC GETPOKEMON funcion que se encargará de recibir el nombre del pokemon y con un scaping closure manejaremos el resultado
    
    func getPokemonData(pokemonName: String ,completion: @escaping (Result<Pokemon ,Error>) -> Void){
        
    //variable creada para concatenar la url base y el nombre de la busqueda
        //El nombre de la busqueda debe pasarse en minusculas asi que añadimos .lowercased()
        let requestUrl = baseUrl.appendingPathComponent(pokemonName.lowercased())
        
    //creamos el URLsession con shared par ainstanciarlo
        URLSession.shared.dataTask(with: requestUrl) { (jsonData, response, error) in
            
    //si hay algun error se maneja con las siguientes lineas
            if let error = error{
                print("error en la bsuqueda: \(error)")
                completion(.failure(error))
                return
            }
    //Manejamos errores de Datos
            guard let data = jsonData else{
                print("Error de Datos")
                completion(.failure(NSError()))
                return
            }
            
    //Decodificamos el Json con referencia a nuestra Struct Pokemon
// MARK: JSON DECODE AND PRINTED
            
            do {
                let decoder = JSONDecoder()
                //Convertimos a Snake case las variables de la estructura
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let pokemon = try decoder.decode(Pokemon.self, from: data)
                //Con el print vemos la data que nos llega
                    
//               if let pureJson = try? JSONSerialization.jsonObject(with: data, options:[]){
//                    print(pureJson)
//                }
                print(pokemon)
                //Salimos del do por el completion con el metodo success
                completion(.success(pokemon))
            } catch{
                //En el bloque Catch vamos a manejar el error de la decodificación
                print("Error al decodificar data:  \(error)")
                completion(.failure(error))
            }
            
            
        }.resume()
        
    }
    
    func addFavoritePokemon(pokemon: Pokemon)  {
        favoritePokemon.append(pokemon)
    }
    
}
