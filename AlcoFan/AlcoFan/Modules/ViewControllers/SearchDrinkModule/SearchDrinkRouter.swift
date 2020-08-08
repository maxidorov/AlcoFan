//
//  SearchDrinkRouter.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 29.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

protocol SearchDrinkRouterProtocol {
    
}

class SearchDrinkRouter {
    var viewController: UIViewController
    init(view: UIViewController) {
        self.viewController = view
    }
}

extension SearchDrinkRouter: SearchDrinkRouterProtocol {
    
}
