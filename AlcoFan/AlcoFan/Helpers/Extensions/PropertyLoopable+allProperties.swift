//
//  PropertyLoopable+allProperties.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 08.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import Foundation

protocol PropertyLoopable {
    func allProperties() throws -> [String : Any]
}

extension PropertyLoopable {
    
    func allProperties() throws -> [String : Any] {

        var result: [String : Any] = [:]
        let mirror = Mirror(reflecting: self)

        guard let style = mirror.displayStyle, style == .struct || style == .class else {
            throw NSError(domain: "hris.to", code: 777, userInfo: nil)
        }

        for (labelMaybe, valueMaybe) in mirror.children {
            guard let label = labelMaybe else {
                continue
            }
            result[label] = valueMaybe
        }

        return result
    }
}
