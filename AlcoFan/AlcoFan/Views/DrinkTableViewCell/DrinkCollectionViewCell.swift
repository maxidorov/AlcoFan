//
//  DrinkCollectionViewCell.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 07.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

class DrinkCollectionViewCell: UICollectionViewCell {
    
    static let cellID = "DrinkCollectionViewCellID"
    
    private var drinkImageView: CachedImageView!
    private var drinkNameLabel: UILabel!
    
    public func configure(with drink: Drink) {
        drinkNameLabel.text = drink.strDrink ?? ""
        drinkImageView.loadImage(from: drink.strDrinkThumb)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let stackView = UIStackView()
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        
        drinkImageView = CachedImageView()
        stackView.addArrangedSubview(drinkImageView)
        drinkImageView.translatesAutoresizingMaskIntoConstraints = false
        drinkImageView.heightAnchor.constraint(equalTo: stackView.heightAnchor).isActive = true
        drinkImageView.heightAnchor.constraint(equalTo: drinkImageView.widthAnchor).isActive = true
        
        drinkNameLabel = UILabel()
        stackView.addArrangedSubview(drinkNameLabel)
        drinkNameLabel.translatesAutoresizingMaskIntoConstraints = false
        drinkImageView.heightAnchor.constraint(equalTo: stackView.heightAnchor).isActive = true
    }
}
