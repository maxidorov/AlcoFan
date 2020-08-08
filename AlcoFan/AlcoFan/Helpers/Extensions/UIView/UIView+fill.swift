//
//  UIView+fill.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 07.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

extension UIView {
    func fill(_ view: UIView, insets: (leading: CGFloat, trailing: CGFloat, top: CGFloat, bottom: CGFloat) = (0, 0, 0, 0)) {
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.leading).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets.trailing).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom).isActive = true
    }
}
