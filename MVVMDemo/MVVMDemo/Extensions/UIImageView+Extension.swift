//
//  UIImageView+Extension.swift
//  MVVMDemo
//
//  Created by Rishi Jha on 01/05/24.
//

import UIKit
import Kingfisher

extension UIImageView{
    func setImage(with urlString: String){
        guard let url = URL(string: urlString) else {
            return
        }
        let resourse = KF.ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resourse)
    }
}
