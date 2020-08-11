//
//  CocktailApiUrlMaker.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 08.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import Foundation

protocol CocktailApiUrlMakerProtocol {
    func getUrl(_ requestTarget: CocktailApiManager.RequestTarget, _ requestStr: String) -> URL
}

class CocktailApiUrlMaker {
    
    private let scheme = "https"
    private let host = "www.thecocktaildb.com"
    
    private enum Path: String {
        case search = "/api/json/v1/1/search.php"
        case lookup = "/api/json/v1/1/lookup.php"
        case random = "/api/json/v1/1/random.php"
    }
    
    private func getBaseUrlComponents() -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        return urlComponents
    }
}

extension CocktailApiUrlMaker: CocktailApiUrlMakerProtocol {
    
    public func getUrl(_ requestTarget: CocktailApiManager.RequestTarget, _ requestStr: String) -> URL {
        
        var urlComponents = getBaseUrlComponents()
        var urlQueryItemName = ""
        
        switch requestTarget {
            
        case .searchCocktailByName:
            urlComponents.path = Path.search.rawValue
            urlQueryItemName = "s"
            
        case .listAllCocktailsByLetter:
            urlComponents.path = Path.search.rawValue
            urlQueryItemName = "f"
            
        case .searchIngredientByName:
            urlComponents.path = Path.search.rawValue
            urlQueryItemName = "i"
            
        case .lookupFullCocktailDetailsId:
            urlComponents.path = Path.lookup.rawValue
            urlQueryItemName = "i"
            
        case .lookupIngredientById:
            urlComponents.path = Path.lookup.rawValue
            urlQueryItemName = "iid"
            
        case .lookupARandomCocktail:
            urlComponents.path = Path.random.rawValue
        }
        
        if urlQueryItemName != "" {
            urlComponents.queryItems = [
                URLQueryItem(name: urlQueryItemName, value: requestStr)
            ]
        }
        
        return urlComponents.url!
    }
}
