//
//  UIImageView+ext.swift
//  NGTest
//
//  Created by Alban Pellegrini on 14/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import UIKit
import SDWebImage

public extension UIImageView {
    func setRemoteImage(_ url: URL?, _ color: UIColor? = UIColor(white: 1, alpha: 0.1), placeholder: UIImage? = UIImage(named: "ic_image_placeholder")) { //
        self.backgroundColor = color
        self.contentMode = .scaleAspectFill
        if let url = url { //
//            self.image = #imageLiteral(resourceName: "ImageLoading") //
            self.sd_setImage(with: url, placeholderImage: placeholder )
        } else {
            self.image = placeholder
        }
    }
}
