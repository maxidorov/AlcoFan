//
//  CachedImageView.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 30.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class CachedImageView: UIImageView {
    
    var imageUrl: String?
    
    func loadImage(from urlStr: String) {
        
        imageUrl = urlStr
        image = UIImage() // placeholder image
        
        if let cachedImage = imageCache.object(forKey: NSString(string: imageUrl!)) {
            image = cachedImage
            return
        }
        
        guard let url = URL(string: urlStr) else {
            return
        }
        
        imageUrl = urlStr
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let err = error {
                print(err)
            } else {
                DispatchQueue.main.async {
                    let tempImg = UIImage(data: data!)
                    if self.imageUrl == urlStr {
                        self.image = tempImg
                    }
                    imageCache.setObject(tempImg!, forKey: NSString(string: urlStr))
                }
            }
        }.resume()
    }
}
