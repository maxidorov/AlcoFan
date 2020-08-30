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

    @IBOutlet private weak var drinkRecipeDescriptionLabel: UILabel! {
        didSet {
            drinkRecipeDescriptionLabel.font = Brandbook.font(size: 12, weight: .medium)
            drinkRecipeDescriptionLabel.textColor = Brandbook.drinkIngredientsSectionTextColor
        }
    }
    
    public func setDrinkRecipeDescription(text: String?) {
        drinkRecipeDescriptionLabel.text = text ?? ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
