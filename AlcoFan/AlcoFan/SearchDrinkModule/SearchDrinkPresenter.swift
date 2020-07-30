//
//  SearchDrinkPresenter.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 29.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import Foundation

protocol SearchDrinkPresenterProtocol {
    func loadAllDrinks()
    func loadDrinksContains(letters: String)
}

class SearchDrinkPresenter {
    
    weak var view: SearchDrinkViewProtocol?
    var interactor: SearchDrinkInteractorProtocol
    var router: SearchDrinkRouterProtocol
    
    init(view: SearchDrinkViewProtocol, interactor: SearchDrinkInteractorProtocol, router: SearchDrinkRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SearchDrinkPresenter: SearchDrinkPresenterProtocol {
    
    func loadAllDrinks() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.interactor.getAllDrinks(completion: { (drinks) in
                DispatchQueue.main.async {
                    self?.view?.updateDrinks(drinks: drinks)
                }
            })
        }
    }
    
    func loadDrinksContains(letters: String) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.interactor.getDrinksContains(letters: letters, completion: { (drinks) in
                DispatchQueue.main.async {
                    self?.view?.updateDrinks(drinks: drinks)
                }
            })
        }
    }
    
}
