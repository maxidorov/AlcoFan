//
//  DrinkCellModuleBuilder.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 08.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

class DrinkCellModuleBuilder {
    
    static func build(collectionView: UICollectionView, cellID: String, indexPath: IndexPath) -> DrinkCell {
        let view = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! DrinkCell
        let interactor = DrinkCellInteractor()
        let presenter = DrinkCellPresenter(view: view, interactor: interactor)
        view.presenter = presenter
        return view
    }
}
