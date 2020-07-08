//
//  CocktailApi.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 08.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import Foundation

class CocktailApiManager {
    
    private let cocktailApiUrlMaker = CocktailApiUrlMaker()
    
    public enum RequestTarget {
        case searchCocktailByName
        case listAllCocktailsByLetter
        case searchIngredientByName
        case lookupFullCocktailDetailsId
        case lookupIngredientById
        case lookupARandomCocktail
    }
    
    public func makeRequest(_ requestTarget: RequestTarget, _ requestStr: String, completion: @escaping((Result<[Drink], NetworkingError>) -> ())) {
        let url = cocktailApiUrlMaker.getUrl(requestTarget, requestStr)
        let drinksQueue = DispatchQueue(label: "drinksQueue", qos: .userInitiated)
        drinksQueue.async {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                do {
                    try NetworkingErrorChecker.valid(data, response, error)
                } catch let error {
                    completion(.failure(error as! NetworkingError))
                }
                do {
                    let drinks = try JSONDecoder().decode(Drinks.self, from: data!)
                    completion(.success(drinks.drinks))
                } catch {
                    completion(.failure(.jsonDecoderError))
                }
            }.resume()
        }
    }
    
    public func loadAllCocktails(completion: @escaping((Result<[Drink], NetworkingError>) -> ())) {
        var drinksByLetterDict = [String: [Drink]]()
        var allDrinks = [Drink]()
        var loadedLetters = 0
        
        let drinksGroup = DispatchGroup()
        drinksGroup.enter()
        
        let alphabet = "abcdefghijklmnopqrstuvwxyz"
        for char in alphabet {
            let letter = String(char)
            makeRequest(.listAllCocktailsByLetter, letter) { (result) in
                loadedLetters += 1
                switch result {
                case .success(let drinks):
                    drinksByLetterDict[letter] = drinks
                    if loadedLetters == alphabet.count {
                        drinksGroup.leave()
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
        
        let drinksQueue = DispatchQueue(label: "drinksQueue", qos: .userInitiated)
        drinksGroup.notify(queue: drinksQueue) {
            for drinks in drinksByLetterDict.values {
                for drink in drinks {
                    allDrinks.append(drink)
                }
            }
            allDrinks.sort{ $0.strDrink! < $1.strDrink! }
            completion(.success(allDrinks))
        }
    }
}
