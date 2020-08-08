//
//  DrinkCellPresenter.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 08.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

protocol DrinkCellPresenterProtocol {
    func loadDrinkName(_ drink: Drink)
    func loadDrinkIngredients(_ drink: Drink)
    func loadDrinkInstructions(_ drink: Drink)
    func loadDrinkPhoto(_ drink: Drink)
}

class DrinkCellPresenter {
    
    weak var view: DrinkCellViewProtocol?
    var interactor: DrinkCellInteractorProtocol
    
    init(view: DrinkCellViewProtocol, interactor: DrinkCellInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }
}

extension DrinkCellPresenter: DrinkCellPresenterProtocol {
    
    func loadDrinkName(_ drink: Drink) {
        let drinkName = interactor.getDrinkName(drink)
        view?.updateDrinkName(drinkName)
    }
    
    func loadDrinkIngredients(_ drink: Drink) {
        let drinkIngredients = interactor.getDrinkIngredients(drink)
        view?.updateDrinkIngredients(drinkIngredients)
    }
    
    func loadDrinkInstructions(_ drink: Drink) {
        let drinkInstructions = interactor.getDrinkInstructions(drink)
        view?.updateDrinkInstructions(drinkInstructions)
    }
    
    func loadDrinkPhoto(_ drink: Drink) {
        let drinkImageUrl = interactor.getDrinkImageUrl(drink)
        view?.updateDrinkImage(drinkImageUrl)
    }
}
