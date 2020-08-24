//
//  SearchDrinkPresenter.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 29.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

protocol SearchDrinkPresenterProtocol {
    func loadAllDrinks()
    func loadDrinksContains(letters: String)
    func pushCocktailDetailsViewController(_ drink: Drink)
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
    
    func pushCocktailDetailsViewController(_ drink: Drink) {
        let cocktailDetailsViewController = CocktailDetailsModuleBuilder.build(drink)
        router.viewController.navigationController?.pushViewController(cocktailDetailsViewController, animated: true)
//        router.viewController.present(cocktailDetailsViewController, animated: true, completion: nil)
    }
}
