//
//  DrinkIngredientCell.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 24.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

class DrinkIngredientCell: UITableViewCell {
    
    static public let cellID = "DrinkIngredientCell"

    @IBOutlet weak private var ingredientNameLabel: UILabel! {
        didSet {
            ingredientNameLabel.font = Brandbook.font(size: 17, weight: .medium)
        }
    }
    
    @IBOutlet weak private var ingredientMeasureLabel: UILabel! {
        didSet {
            ingredientMeasureLabel.font = Brandbook.font(size: 17, weight: .medium)
        }
    }
    
    struct DrinkIngredientCellViewModel {
        var ingredientName: String
        var ingredientMeasure: String
    }
    
    public func configure (_ drinkIngredientCellViewModel: DrinkIngredientCellViewModel) {
        ingredientNameLabel.text = drinkIngredientCellViewModel.ingredientName
        ingredientMeasureLabel.text = drinkIngredientCellViewModel.ingredientMeasure
    }
}
