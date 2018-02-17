//
//  Pokemon.swift
//  pokedex
//
//  Created by Tomáš Novák on 14.02.18.
//  Copyright © 2018 Tomáš Novák. All rights reserved.
//

import Foundation
import Alamofire
class Pokemon {
    private var _name: String!
    private var _pokedexID: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _pokemonUrl: String!
    private var _speciesURL: String!
    
    
    var height: String! {
        
        get {
            if _height == nil {
                _height = ""
            }
            return _height
        }
    }
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var name: String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    var pokedexID: Int {
        if _pokedexID == nil {
            _pokedexID = 0
        }
        return _pokedexID
    }
    init(name: String, pokedexID: Int) {
        self._name = name
        self._pokedexID = pokedexID
        
        self._pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexID)/"
        self._speciesURL = "\(URL_BASE)\(URL_POKEMON_SPECIES)\(self.pokedexID)"
        
        
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        
        
        Alamofire.request(_pokemonUrl, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { response in
            if let dict = response.result.value as? Dictionary<String,AnyObject>{
                
                if let weight = dict["weight"] as? Int {
                    self._weight = String(weight)
                }
                if let height = dict["height"] as? Int {
                    self._height = String(height)
                }
                if let attack = dict["base_experience"] as? Int {
                    self._attack = String(attack)
                }
                if let defense = dict["order"] as? Int {
                    self._defense = String(defense)
                }
                
                
                
                print(self._weight)
                print(self._height)
                print(self._attack)
                print(self._defense)
                

           
            }
            completed()
            
            
        }
        // Function suspended, API has not enough info for description
        //        Alamofire.request(_speciesURL, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { response in
//            if let species = response.result.value as? Dictionary<String, AnyObject> {
//                if let descript = species[""]
//            }
//        }
    }
}
