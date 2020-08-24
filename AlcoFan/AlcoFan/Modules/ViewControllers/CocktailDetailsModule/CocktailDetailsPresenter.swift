//
//  CocktailDetailsPresenter.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 09.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

protocol CocktailDetailsPresenterProtocol {
}

class CocktailDetailsPresenter {
    
    weak var view: CocktailDetailsViewProtocol?
    var interactor: CocktailDetailsInteractorProtocol
    var router: CocktailDetailsRouterProtocol
    
    init(view: CocktailDetailsViewProtocol, interactor: CocktailDetailsInteractorProtocol, router: CocktailDetailsRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension CocktailDetailsPresenter: CocktailDetailsPresenterProtocol {
}
