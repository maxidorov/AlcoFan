//
//  DrinkCellInteractor.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 08.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

protocol DrinkCellInteractorProtocol {
    func getDrinkName(_ drink: Drink) -> String
    func getDrinkIngredientsInString(_ drink: Drink) -> String
    func getDrinkInstructions(_ drink: Drink) -> String
    func getDrinkImageUrl(_ drink: Drink) -> String?
}

class DrinkCellInteractor { }

extension DrinkCellInteractor: DrinkCellInteractorProtocol {
    
    func getDrinkName(_ drink: Drink) -> String {
        return drink.strDrink ?? ""
    }
    
    func getDrinkIngredientsInString(_ drink: Drink) -> String {
        
        var drinkProperties = [String : Any]()
        do {
            drinkProperties = try drink.allProperties()
        } catch  {
            print(error)
            return "error in \(#function)"
        }
        
        var ingredients = ""
        for i in 1...15 {
            guard let ingredient = drinkProperties["strIngredient\(i)"] else { break }
            if let strIngredient = ingredient as? String {
                ingredients += (i != 1 ? ", " : "") + strIngredient
            }
        }
        
        return ingredients
    }
    
    func getDrinkInstructions(_ drink: Drink) -> String {
        return drink.strInstructions ?? ""
    }
    
    func getDrinkImageUrl(_ drink: Drink) -> String? {
        return drink.strDrinkThumb
    }
}
