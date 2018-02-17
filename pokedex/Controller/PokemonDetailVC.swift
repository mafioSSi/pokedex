//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Tomáš Novák on 16.02.18.
//  Copyright © 2018 Tomáš Novák. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var pokeLBL: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoLbl: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pokeLBL.text = pokemon.name.capitalized
        mainImg.image = UIImage(named: "\(pokemon.pokedexID)")
        
        hideDefaultValues()
        
        
        pokemon.downloadPokemonDetails { () -> () in
            //tohle se zavola po dokonceni stahovani
            self.updateUI()
        }
    }
    func updateUI() {
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        pokedexLbl.text = "\(pokemon.pokedexID)"
    }
    func hideDefaultValues() {
        heightLbl.text = ""
        weightLbl.text = ""
        attackLbl.text = ""
        defenseLbl.text = ""
        pokedexLbl.text = ""
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    

}
