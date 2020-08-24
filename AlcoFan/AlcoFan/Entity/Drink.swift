//
//  Drink.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 08.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import Foundation

struct Drink: Decodable, PropertyLoopable {
    var idDrink: String?
    var strDrink: String?
    var strDrinkAlternate: String?
    var strTags: String?
    var strVideo: String?
    var strCategory: String?
    var strIBA: String?
    var strAlcoholic: String?
    var strGlass: String?
    var strInstructions: String?
    var strDrinkThumb: String?
    
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    
    var strCreativeCommonsConfirmed: String?
    var dateModified: String?
}

extension Drink {
    func containsLetters(_ letters: String) -> Bool {
        guard strDrink != nil else { return letters == "" }
        return strDrink!.lowercased().hasPrefix(letters.lowercased())
    }
}

extension Drink {
    
    func getNumeratedProperty(_ property: String, index: Int) -> String {
        var drinkProperties = [String : Any]()
        
        do {
            drinkProperties = try self.allProperties()
        } catch  {
            print(error)
            return "error in \(#function)"
        }
        
        if let value = drinkProperties["\(property)\(index)"] as? String {
            return value
        }
        return "taste"
    }
    
    func getNumeratedProperties(_ property: DrinkNumeratedProperty) -> [String] {
        var propertyValues = [String]()
        
        var drinkProperties = [String : Any]()
        do {
            drinkProperties = try self.allProperties()
        } catch  {
            print(error)
            return ["error in \(#function)"]
        }
        
        for i in 1...15 {
            guard let propertyValue = drinkProperties["\(property.rawValue)\(i)"] else { break }
            if let strpropertyValue = propertyValue as? String {
                propertyValues.append(strpropertyValue)
            }
        }
        
        return propertyValues
    }
    
    var ingredientsNamesCount: Int {
        self.getNumeratedProperties(.ingredient).count
    }
    
    var ingredientsMeasuresCount: Int {
        self.getNumeratedProperties(.measure).count
    }
}
