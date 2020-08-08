//
//  CustomCachedView.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 07.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

class CustomCachedImageView: CachedImageView {
    
    var borderWidth: CGFloat = 4.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var borderColor: UIColor = .white {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.masksToBounds = true
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        layer.cornerRadius = bounds.width / 2
    }
}
