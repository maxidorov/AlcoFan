//
//  UIViewController+setupTransparentNavigationBar.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 13.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

extension UIViewController {
    func setupTransparentNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
}
