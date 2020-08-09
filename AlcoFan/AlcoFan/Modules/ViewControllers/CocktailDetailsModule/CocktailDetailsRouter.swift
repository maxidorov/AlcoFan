//
//  CocktailDetailsRouter.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 09.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

protocol CocktailDetailsRouterProtocol {
    var viewController: UIViewController { get set }
}

class CocktailDetailsRouter: CocktailDetailsRouterProtocol {
    var viewController: UIViewController
    init(view: UIViewController) {
        self.viewController = view
    }
}
