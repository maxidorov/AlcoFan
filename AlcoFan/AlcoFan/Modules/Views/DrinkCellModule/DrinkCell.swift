//
//  DrinkCell.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 07.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

protocol DrinkCellViewProtocol: class {
    func updateDrinkName(_ drinkName: String)
    func updateDrinkIngredients(_ drinkIngredients: String)
    func updateDrinkInstructions(_ drinkInstructions: String)
    func updateDrinkImage(_ drinkImageUrl: String?)
}

class DrinkCell: UICollectionViewCell {
    
    public var presenter: DrinkCellPresenter?
    
    static public let cellID = "DrinkCellID"
    
    @IBOutlet weak private var backShadowView: UIView!
    
    @IBOutlet weak private var stackView: UIStackView!
    
    @IBOutlet weak private var backDrinkImageView: UIView!
    
    @IBOutlet weak private var drinkImageView: CustomCachedImageView!
    
    @IBOutlet weak private var drinkNameLabel: UILabel! {
        didSet {
            drinkNameLabel.font = Brandbook.font(size: 20, weight: .bold)
        }
    }
    
    @IBOutlet weak private var drinkIngredientsLabel: UILabel! {
        didSet {
            drinkIngredientsLabel.font = Brandbook.font(size: 12, weight: .medium)
        }
    }
    
    @IBOutlet weak private var drinkInstructionsLabel: UILabel! {
        didSet {
            drinkInstructionsLabel.font = Brandbook.font(size: 12, weight: .medium)
            drinkInstructionsLabel.textColor = .lightGray
        }
    }
    
    public func configure(with drink: Drink) {
        presenter?.loadDrinkName(drink)
        presenter?.loadDrinkIngredients(drink)
        presenter?.loadDrinkInstructions(drink)
        presenter?.loadDrinkPhoto(drink)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backShadowView.cornerRadius = backShadowView.frame.height * 0.2
        backShadowView.addShadow()
        backDrinkImageView.addShadow()
    }
}

extension DrinkCell: DrinkCellViewProtocol {
    
    func updateDrinkName(_ drinkName: String) {
        drinkNameLabel.text = drinkName
    }
    
    func updateDrinkIngredients(_ drinkIngredients: String) {
        drinkIngredientsLabel.text = drinkIngredients
    }
    
    func updateDrinkInstructions(_ drinkInstructions: String) {
        drinkInstructionsLabel.text = drinkInstructions
    }
    
    func updateDrinkImage(_ drinkImageUrl: String?) {
        drinkImageView.loadImage(from: drinkImageUrl)
    }
}
