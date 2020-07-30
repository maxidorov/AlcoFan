//
//  SearchDrinkInteractor.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 29.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import Foundation

protocol SearchDrinkInteractorProtocol {
    func getAllDrinks(completion: @escaping([Drink]) -> ())
    func getDrinksContains(letters: String, completion: @escaping([Drink]) -> ())
}

class SearchDrinkInteractor {
    var cocktailApiManager: CocktailApiManagerProtocol!
    var allDrinks: [Drink] = []
}

extension SearchDrinkInteractor: SearchDrinkInteractorProtocol {
    
    func getAllDrinks(completion: @escaping([Drink]) -> ()) {
        
        guard allDrinks.isEmpty else {
            completion(allDrinks)
            return
        }
        
        cocktailApiManager.loadAllCocktails { (result) in
            switch result {
            case .success(let drinks):
                self.allDrinks = drinks
                completion(drinks)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getDrinksContains(letters: String, completion: @escaping ([Drink]) -> ()) {
        
        guard allDrinks.isEmpty else {
            completion(allDrinks.filter { $0.containsLetters(letters) })
            return
        }
        
        getAllDrinks { (drinks) in
            completion(drinks.filter { $0.containsLetters(letters) })
        }
    }
}
