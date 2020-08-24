//
//  CocktailDetailsInteractor.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 09.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

protocol CocktailDetailsInteractorProtocol {
    func getDrinkIngredientsNames(_ drink: Drink) -> [String]
    func getDrinkIngredientsMeasures(_ drink: Drink) -> [String]
}

class CocktailDetailsInteractor { }

extension CocktailDetailsInteractor: CocktailDetailsInteractorProtocol {
    func getDrinkIngredientsNames(_ drink: Drink) -> [String] {
        drink.getNumeratedProperties("strIngredient")
    }
    
    func getDrinkIngredientsMeasures(_ drink: Drink) -> [String] {
        drink.getNumeratedProperties("strMeasure")
    }
}
