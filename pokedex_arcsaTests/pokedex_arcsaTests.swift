//
//  pokedex_arcsaTests.swift
//  pokedex_arcsaTests
//
//  Created by Cesar on 06/02/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import XCTest
@testable import pokedex_arcsa

class pokedex_arcsaTests: XCTestCase {
    
    //Se probará que la funcion getPokemonData no falle en la ejecucion  y que nos regrese el pokemon correcto al comparar los nombres de pokemonTestName y pokemon?.name.

    var pokemonController: PokeApiController?
    let pokemonTestName = "pikachu"
    var pokemon: Pokemon?
    var validVar: Bool?
    
 func validation(){
        
    XCTAssertTrue(testValidRequest())
        
    }
    
 func testValidRequest() -> Bool {
        
        pokemonController?.getPokemonData(pokemonName: pokemonTestName , completion: { (pokemon) in
             guard let _ = try? pokemon.get() else{ return}
            
        })
        
        if pokemon?.name == pokemonTestName {
            validVar = true
            return true}
        else{
            validVar = false
            return false }
    }
    
    
    
    
    
    

}
