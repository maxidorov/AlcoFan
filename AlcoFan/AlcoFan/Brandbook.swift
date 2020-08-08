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
}

