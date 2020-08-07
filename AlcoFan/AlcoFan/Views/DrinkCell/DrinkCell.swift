//
//  DrinkCell.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 07.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

class DrinkCell: UICollectionViewCell {
    
    static public let cellID = "DrinkCellID"
    
    @IBOutlet weak var backShadowView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var backDrinkImageView: UIView!
    @IBOutlet weak var drinkImageView: CustomCachedImageView!
    @IBOutlet weak var drinkNameLabel: UILabel!
    
    public func configure(with drink: Drink) {
        drinkNameLabel.text = drink.strDrink ?? ""
        drinkImageView.loadImage(from: drink.strDrinkThumb)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .blue
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backShadowView.cornerRadius = backShadowView.frame.height * 0.2
        backShadowView.addShadow()
        
        backDrinkImageView.addShadow()
    }
}
