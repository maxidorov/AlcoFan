//
//  DrinkIngredientCell.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 24.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

class DrinkIngredientCell: UITableViewCell {
    
    static public let cellID = "DrinkIngredientCellID"
    
    private var cellFont = Brandbook.font(size: 14, weight: .bold)
    private var cellTextColor = Brandbook.drinkIngredientsSectionTextColor

    @IBOutlet weak private var ingredientNameLabel: UILabel! {
        didSet {
            ingredientNameLabel.font = cellFont
            ingredientNameLabel.textColor = cellTextColor
        }
    }
    
    @IBOutlet weak private var ingredientMeasureLabel: UILabel! {
        didSet {
            ingredientMeasureLabel.font = cellFont
            ingredientMeasureLabel.textColor = cellTextColor
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
