//
//  ArticleContentImageCell.swift
//  NGTest
//
//  Created by Alban Pellegrini on 14/08/2019.
//  Copyright © 2019 Nuglif. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleContentImageCell: UITableViewCell {
    @IBOutlet private weak var contentImageView: UIImageView!
    @IBOutlet private weak var captionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(mobileChapter: MobileChapter) {
        if let urlString = mobileChapter.urlPattern, let url = URL(string: urlString) {
            contentImageView.setRemoteImage(url)
        }
        captionLabel.text = mobileChapter.caption ?? ""
    }
    
}
