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
    var placeholderImage = UIImage()
    
    func loadImage(from urlStr: String?) {
        
        guard urlStr != nil else {
            return
        }
        
        image = placeholderImage
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlStr!)) {
            image = cachedImage
            return
        }
        
        guard let url = URL(string: urlStr!) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let err = error {
                print(err)
            } else {
                DispatchQueue.main.async {
                    let imageFromData = UIImage(data: data!)
                    if self.imageUrl == urlStr {
                        self.image = imageFromData
                    }
                    imageCache.setObject(imageFromData!, forKey: NSString(string: urlStr!))
                }
            }
        }.resume()
    }
}
