//
//  SearchDrinkModuleBuilder.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 29.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

class SearchDrinkModuleBuilder {

    static func build() -> UIViewController {
        let view = SearchDrinkViewController()
        let interactor = SearchDrinkInteractor()
        interactor.cocktailApiManager = CocktailApiManager()
        let router = SearchDrinkRouter(view: view)
        let presenter = SearchDrinkPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
}
