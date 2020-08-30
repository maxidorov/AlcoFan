//
//  DrinkRecipeLabelCell.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 30.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

class DrinkRecipeLabelCell: UITableViewCell {
    
    static public let cellID = "DrinkRecipeLabelCellID"
    
    @IBOutlet weak var recipeLabel: UILabel! {
        didSet {
            recipeLabel.text = "Recipe"
            recipeLabel.font = Brandbook.font(size: 18, weight: .bold)
            recipeLabel.textColor = Brandbook.drinkIngredientsSectionTextColor
        }
    }
}
