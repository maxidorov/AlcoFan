//
//  CustomCachedView.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 07.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

class CustomCachedImageView: CachedImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cornerRadius = frame.width / 2
    }
}
