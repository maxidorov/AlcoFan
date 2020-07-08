//
//  Ingredient.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 09.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import Foundation

struct Ingredient: Decodable {
    var idIngredient: String?
    var strIngredient: String?
    var strDescription: String?
    var strType: String?
    var strAlcohol: String?
    var strABV: String?
}
