//
//  CocktailDetailsViewController.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 09.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

protocol CocktailDetailsViewProtocol: class {
    
}

class CocktailDetailsViewController: UIViewController {
    
    public var presenter: CocktailDetailsPresenter?
    
    private var drink: Drink
    
    init(_ drink: Drink) {
        self.drink = drink
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = drink.strDrink ?? "??"
    }
}

extension CocktailDetailsViewController: CocktailDetailsViewProtocol {
    
}
