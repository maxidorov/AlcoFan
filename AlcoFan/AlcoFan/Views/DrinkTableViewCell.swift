//
//  DrinkTableViewCell.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 30.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

class DrinkTableViewCell: UITableViewCell {

    @IBOutlet weak var drinkImageView: CachedImageView!
    @IBOutlet weak var drinkNameLabel: UILabel!
    
    func configure(with drink: Drink) {
        drinkNameLabel.text = drink.strDrink ?? ""
        if let drinkImageUrlStr = drink.strDrinkThumb {
            drinkImageView.loadImage(from: drinkImageUrlStr)
        }
    }
}
