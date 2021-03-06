//
//  Brandbook.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 08.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

internal final class Brandbook {
    
    internal enum Weight: String {
        case thin    = "Thin"
        case regular = "Regular"
        case bold    = "Bold"
        case medium  = "Medium"
        case heavy   = "Heavy"
    }
    
    internal static func font(size: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
    
    static let mediumGray = UIColor(red: 118 / 255.0, green: 118 / 255.0, blue: 118 / 255.0, alpha: 1)
}

extension Brandbook {
    internal static var drinkIngredientsSectionTextColor: UIColor {
        return mediumGray
    }
    
    internal static var drinkIngredientsTableViewSeparatorColor: UIColor {
        return mediumGray
    }
}

extension Brandbook {
    static let navigationBarTintColor = UIColor.white
}

