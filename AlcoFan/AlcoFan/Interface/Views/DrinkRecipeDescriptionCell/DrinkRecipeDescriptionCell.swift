//
//  DrinkRecipeDescriptionCell.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 30.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

class DrinkRecipeDescriptionCell: UITableViewCell {
    
    static public let cellID = "DrinkRecipeDescriptionCellID"

    @IBOutlet weak private var drinkRecipeDescriptionTextView: UITextView! {
        didSet {
            drinkRecipeDescriptionTextView.font = Brandbook.font(size: 12, weight: .medium)
            drinkRecipeDescriptionTextView.textColor = Brandbook.drinkIngredientsSectionTextColor
            drinkRecipeDescriptionTextView.isEditable = false
            drinkRecipeDescriptionTextView.isSelectable = false
            drinkRecipeDescriptionTextView.isUserInteractionEnabled = false
        }
    }
    
    public func setDrinkRecipeDescription(text: String?) {
        drinkRecipeDescriptionTextView.text = text ?? ""
    }
}
