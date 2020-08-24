//
//  CocktailDetailsModuleBuilder.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 09.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

class CocktailDetailsModuleBuilder {
    
    static func build(_ drink: Drink) -> UIViewController {
        
        let view = CocktailDetailsViewController(drink)
        let interactor = CocktailDetailsInteractor()
        let router = CocktailDetailsRouter(view: view)
        let presenter = CocktailDetailsPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
}
