//
//  UIImageView+makeRounded.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 07.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

extension UIImageView {
    func makeRounded() {
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }
}


class RoundedCachedImageView: CachedImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        cornerRadius = frame.width / 2
        layer.borderWidth = 4
        layer.borderColor = UIColor.white.cgColor
//        clipsToBounds = true
    }
}
