//
//  UIView+addShadow.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 07.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

extension UIView {
    func addShadow(opacity: Float = 0.4, color: UIColor = .lightGray, offset: CGSize = .zero, radius: CGFloat = 8) {
        (shadowOpacity, shadowColor, shadowOffset, shadowRadius) = (opacity, color, offset, radius)
    }
}
